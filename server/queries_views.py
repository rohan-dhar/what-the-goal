from flask.helpers import url_for
from .generic_views import LoggedInView, QueryView
from .queries import queries
from flask import Blueprint, abort


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
            if queries[idx].is_allowed()
        ]

        return super().render(queries=query_urls)


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
