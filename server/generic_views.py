from flask.views import View
from flask import render_template
from .utils import get_user_id


class TemplateView(View):
    # def __init__(self, template):
    #     self.template = template

    def render(self, *args, **kwargs):
        return render_template(self.template, *args, **kwargs)


class LoggedInView(TemplateView):
    def render(self, *args, **kwargs):
        user_id = get_user_id()
        if user_id is not None:
            return super().render(*args, **kwargs)

        return "logged out :("


class LoggedOutView(TemplateView):
    def render(self, *args, **kwargs):
        user_id = get_user_id()
        if user_id is None:
            return super().render(*args, **kwargs)

        return "Logged in!"
