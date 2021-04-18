from flask import g, session
from pymysql import cursors
import pymysql


db_conf = {
    "host": "127.0.0.1",
    "user": "root",
    "password": "password",
    "database": "football",
}


def setup_db(app):
    @app.before_request
    def setup():
        if "db" in g:
            return

        db = pymysql.connect(
            **db_conf,
            autocommit=True,
        )
        g.db = db
        user_id = session.get("user_id", None)
        g.user_id = user_id


def close_db(exception):

    db = g.pop("db", None)

    if db is None:
        return

    db.close()
