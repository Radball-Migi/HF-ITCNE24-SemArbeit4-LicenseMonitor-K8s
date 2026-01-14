from flask import Blueprint, render_template

bp = Blueprint("main", __name__)

@bp.route('/')
def show_frontend():
    return render_template("mainpage.html")
