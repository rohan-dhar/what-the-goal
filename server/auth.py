from flask import Blueprint
from .generic_views import LoggedOutView


class LoginView(LoggedOutView):
    template = "auth/login.html"

    def dispatch_request(self):
        return self.render()


class RegisterView(LoggedOutView):
    template = "auth/register.html"

    def dispatch_request(self):
        return self.render()


auth_bp = Blueprint("auth", __name__, url_prefix="/auth")
auth_bp.add_url_rule("/login", view_func=LoginView.as_view(name="login"))
auth_bp.add_url_rule("/register", view_func=RegisterView.as_view(name="register"))
