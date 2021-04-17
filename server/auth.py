from flask import Blueprint, session
from flask.globals import request
from flask.helpers import url_for
from werkzeug.utils import redirect
from .generic_views import LoggedOutView


class LoginView(LoggedOutView):
    methods = ["GET", "POST"]
    template = "auth/login.html"

    def dispatch_request(self):
        error = None
        if request.method == "POST":
            # Pull from DB
            if (
                request.form["email"] == "lol@lol.com"
                and request.form["password"] == "test"
            ):
                session["user_id"] = 1
                return redirect(url_for("queries.index"))
            else:
                error = "Incorrect username or password. Please try again with correct credentials"

        return super().render(error=error)


auth_bp = Blueprint("auth", __name__, url_prefix="/auth")
auth_bp.add_url_rule("/login", view_func=LoginView.as_view(name="login"))
