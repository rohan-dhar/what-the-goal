from flask import Flask
from .auth import auth_bp

from .queries import queries_bp

app = Flask(__name__)
app.config["SESSION_TYPE"] = "filesystem"
app.register_blueprint(auth_bp)
app.register_blueprint(queries_bp)
app.secret_key = "ygi7*%^%Ur76ti7yfrye4d5eFY%^UV&ITB&*YL(UJ(PNY&*GBI^VU%RD&"
