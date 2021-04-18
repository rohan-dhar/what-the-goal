from flask.globals import g
from flask.helpers import url_for
from flask.views import View
from flask import render_template, request
from werkzeug.utils import redirect


LOGGED_IN_PATH = "queries.index"
LOGGED_OUT_PATH = "auth.login"


class TemplateView(View):
    # def __init__(self, template):
    #     self.template = template

    def render(self, *args, **kwargs):
        return render_template(self.template, *args, **kwargs)

    def dispatch_request(self):
        return self.render()


class LoggedInView(TemplateView):
    def render(self, *args, **kwargs):
        user_id = g.user_id
        if user_id is not None:
            return super().render(*args, **kwargs)

        return redirect(url_for(LOGGED_IN_PATH))


class LoggedOutView(TemplateView):
    def render(self, *args, **kwargs):
        user_id = g.user_id
        if user_id is None:
            return super().render(*args, **kwargs)

        return redirect(url_for(LOGGED_IN_PATH))


class QueryView(LoggedInView):
    template = "/queries/query.html"

    methods = ["GET", "POST"]

    def render(self, *args, **kwargs):
        if request.method != "GET" and request.method != self.query.method:
            return f"{request.method} method not allowed for this route!"

        if not self.query.is_allowed():
            return redirect(url_for("queries.unauth"))

        return super().render(**self.query.get_context())