from .generic_views import LoggedInView, QueryView
from flask import Blueprint, g


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
        return [
            ["Bob", "2000", "21"],
            ["Bob", "2000", "21"],
            ["Bob", "2000", "21"],
            ["Bob", "2000", "21"],
        ]


class UnauthView(LoggedInView):
    template = "queries/unauth.html"


class IndexView(LoggedInView):
    template = "queries/index.html"


class ShowQueryView(QueryView):
    query = QueryWrapper(
        "This is a heading",
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
    )


queries_bp = Blueprint("queries", __name__, url_prefix="/queries")

queries_bp.add_url_rule("/show", view_func=ShowQueryView.as_view(name="show"))
queries_bp.add_url_rule("/unauth", view_func=UnauthView.as_view(name="unauth"))
queries_bp.add_url_rule("/", view_func=IndexView.as_view(name="index"))
