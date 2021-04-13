from flask import g, session, Blueprint


def get_user_id():
    user_id = session.get("user_id", None)
    g.user_id = user_id
    return user_id
