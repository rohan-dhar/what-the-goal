from flask import g
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
        print("INHERE")
        if "db" in g:
            print("ALREADY")
            return

        db = pymysql.connect(
            **db_conf,
            cursorclass=cursors.DictCursor,
            autocommit=True,
        )

        g.db = db


def close_db(exception):

    db = g.pop("db", None)

    if db is None:
        return

    db.close()
