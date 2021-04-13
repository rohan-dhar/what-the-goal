from flask import Flask
from .auth import auth_bp

app = Flask(__name__)
app.register_blueprint(auth_bp)