from flask import request, g
from server.utils import to_int
from flask.globals import request

"""

Steps to add a query

1. Create a new uniquely named function to run query (maybe like qn_runner,
    where n is the index of the query, but technically any unique name works)

2. The runner will receive parameters entered by user and DB cursor, and the function
    should return a 2D array, where each row is a result row. Use the cursor passed in, and generate 
    the query to run based on these params. If user has not passed any parameters, either omit the parameter,
    or pass in a reasonable default.

3. Not create a QueryWrapper Object, and add it to the 'queries' array present globally in this file

4. Pass in the following to the QueryWrapper constructor:
    
    a) Passing the runner function created previously by name as the first parameter to constructor
    and descriptive values for heading and text as well, to the constructor.

    b) Also pass the parameters available to the user as an array of dicts to the constructor. The keys in dict will be passed to the HTML
    <input>  element as parameters. For example. 'type':'text' or 'name': 'some_name' or 'max_length': 200 etc.

    c) Also pass in the headers that will be displayed in the table to the user as an array of strings.

    d) Pass in the type of users allowed to run the query as the allowed argument. This should be an array of user_types[x]
    where x is one of ALL, CUSTOMER, PLAYER, MANAGER or DIRECTOR. All will let any user run the code.
    eg: allowed=[ user_types['PLAYER'], user_types['DIRECTOR'] ] -> Allow players and directors to run the query.

"""

user_types = {"ALL": 0, "CUSTOMER": 1, "PLAYER": 2, "MANAGER": 3, "DIRECTOR": 4}


class QueryWrapper:
    def __init__(
        self,
        query_runner,
        heading="",
        text="",
        params=[],
        allowed=[],
        headers=[],
        method="GET",
    ):
        self.heading = heading
        self.text = text
        self.query_runner = query_runner
        self.params = params

        # Array of all, customer, player, director, manager, example: [user_types['PLAYER'],  user_types['DIRECTOR']]
        self.allowed = allowed
        self.method = method
        self.headers = headers

    def is_allowed(self):
        user_id = g.user_id
        user_type = None
        # NOTE: User ID 1 allowed to do everything, and everyone can execute query with allowed ALL
        if user_id == 1 or user_types["ALL"] in self.allowed:
            return True

        search_data = [
            {
                "type": "CUSTOMER",
                "table": "customer",
                "column": "ID",
            },
            {
                "type": "PLAYER",
                "table": "player",
                "column": "player_ID",
            },
            {
                "type": "MANAGER",
                "table": "manager",
                "column": "manager_ID",
            },
            {
                "type": "DIRECTOR",
                "table": "director",
                "column": "director_ID",
            },
        ]

        with g.db.cursor() as cursor:
            for table in search_data:
                cursor.execute(
                    f""" 
                    SELECT
                        {table['column']} FROM {table['table']}
                    WHERE
                        {table['column']} = %s
                    LIMIT 1
                """,
                    (user_id,),
                )
                res = cursor.fetchone()
                if res is not None:
                    user_type = table["type"]
                    break

        return user_types[user_type] in self.allowed

    def get_context(self):
        res = self.get_res()
        return {
            "heading": self.heading,
            "text": self.text,
            "method": self.method,
            "params": [
                {**param, "value": request.form.get(param["name"], "")}
                for param in self.params
            ],
            "headers": self.headers,
            "results": res[0],
            "query": res[1],
        }

    def get_res(self):
        with g.db.cursor() as cursor:
            return self.query_runner(cursor, request.form)


def q0_runner(cursor, params):
    qry = """
        SELECT
            d.director_name,
            t.team_name,
            t.team_owner,
            t.team_trophies,
            t.team_expenses
        FROM team t, director d
        WHERE t.director_ID = d.director_ID 
    """

    # Access like this, if needed. Not used in this particular query, just for reference
    user_id = g.user_id

    name = params.get("director_name", None)
    idx = to_int(params.get("director_id", None))
    run_params = []

    if type(name) == str and name.strip() != "":
        qry += " AND UPPER(d.director_name) LIKE %s "
        run_params.append(f"%{name}%")

    if idx is not None:
        qry += " AND d.director_id = %s"
        run_params.append(idx)

    cursor.execute(qry, run_params)
    return [cursor.fetchall(), cursor._last_executed]


queries = [
    QueryWrapper(
        q0_runner,
        "All teams of a director",
        "List the details of all the teams belong to a director. You can filter values by  entering director's name or by entering director's ID. Keep a field to list all values. ",
        params=[
            {
                "placeholder": "Enter a director name",
                "type": "text",
                "name": "director_name",
            },
            {
                "placeholder": "Enter a director ID",
                "type": "number",
                "name": "director_id",
            },
        ],
        allowed=[user_types["DIRECTOR"]],
        headers=[
            "Director Name",
            "Team Name",
            "Owner's Name",
            "Number of trophies",
            "Team's expenses (€)",
        ],
        method="POST",
    ),
]
