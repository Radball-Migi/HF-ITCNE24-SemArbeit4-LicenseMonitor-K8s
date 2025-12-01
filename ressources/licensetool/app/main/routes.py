from flask import render_template

from app.main import bp


@bp.route('/')
def show_frontend():
    return render_template("mainpage.html")
