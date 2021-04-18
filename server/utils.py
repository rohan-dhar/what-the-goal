from flask import g, session, Blueprint


def to_int(num):
    try:
        num = int(num)
        return num
    except:
        return None