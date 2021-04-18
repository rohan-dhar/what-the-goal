from flask import Flask, g
from .auth import auth_bp
from .db import close_db, setup_db
from .queries_views import queries_bp


app = Flask(__name__)
app.config["SESSION_TYPE"] = "filesystem"
app.secret_key = "ygi7*%^%Ur76ti7yfrye4d5eFY%^UV&ITB&*YL(UJ(PNY&*GBI^VU%RD&"


setup_db(app)

app.register_blueprint(auth_bp)
app.register_blueprint(queries_bp)

app.teardown_appcontext(close_db)
