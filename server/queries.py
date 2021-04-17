from flask.helpers import url_for
from .generic_views import LoggedInView, QueryView
from flask import Blueprint, g, abort


class QueryWrapper:
    def __init__(
        self,
        heading="",
        text="",
        qry="",
        params=[],
        allowed=[],
        headers=[],
        method="GET",
    ):
        self.heading = heading
        self.text = text
        self.qry = qry
        self.params = params
        self.allowed = allowed
        self.method = method
        self.headers = headers

    def is_allowed(self):
        return True

    def get_context(self):
        return {
            "heading": self.heading,
            "text": self.text,
            "method": self.method,
            "params": [
                {**self.params[i], "name": str(i)} for i in range(len(self.params))
            ],
            "headers": self.headers,
            "results": self.get_res(),
        }

    def get_res(self):
        with g.db.cursor() as cursor:
            cursor.execute("SHOW TABLES")
        return []


class UnauthView(LoggedInView):
    template = "queries/unauth.html"


class IndexView(LoggedInView):
    template = "queries/index.html"

    def render(
        self,
    ):

        query_urls = [
            {
                "url": url_for("queries.run", query_idx=idx),
                "heading": queries[idx].heading,
                "text": queries[idx].text,
            }
            for idx in range(len(queries))
        ]

        return super().render(queries=query_urls)


queries = [
    QueryWrapper(
        "Some query name",
        "This is some text. This is some text. This is some text. This is some text. This is some text. This is some text. ",
        qry="",
        params=[
            {
                "placeholder": "Enter a name",
                "required": "false",
                "type": "text",
                "default": "Some Name",
            },
            {"placeholder": "Enter a age", "required": "true", "type": "number"},
        ],
        allowed=[],
        headers=["Name", "Age (Years)", "Height (m)"],
        method="POST",
    ),
    QueryWrapper(
        "This is another query",
        "This is some text. This is some text. This is some text. This is some text. This is some text. This is some text. ",
        qry="",
        params=[
            {
                "placeholder": "Enter a name",
                "required": "false",
                "type": "text",
                "default": "Some Name",
            },
            {"placeholder": "Enter a age", "required": "true", "type": "number"},
        ],
        allowed=[],
        headers=["Name", "Age (Years)", "Height (m)"],
        method="POST",
    ),
]


class ShowQueryView(QueryView):
    query = None

    def dispatch_request(self, query_idx):
        if query_idx < 0 or query_idx >= len(queries):
            abort(404)
        self.query = queries[query_idx]
        return super().dispatch_request()


queries_bp = Blueprint("queries", __name__, url_prefix="/queries")
queries_bp.add_url_rule("/<int:query_idx>", view_func=ShowQueryView.as_view(name="run"))
queries_bp.add_url_rule("/unauth", view_func=UnauthView.as_view(name="unauth"))
queries_bp.add_url_rule("/", view_func=IndexView.as_view(name="index"))
