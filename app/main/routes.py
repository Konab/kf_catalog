from app.main import bp
from app.main.forms import FilterForm

from libs.orm import DB

from flask import render_template, request, redirect, url_for


@bp.route("/object")
def empty_page():
    return render_template(
        "page/index.html",
    )


@bp.route("/object/<int:obj_id>")
def page(obj_id):
    with DB() as db:
        obj = db.execute(
            db.get_sql_query(
                'get_current_object',
                params={
                    'obj_id': obj_id,
                }
            )
        )
    return render_template(
        "page/index.html",
        obj=obj
    )


@bp.route("/search")
def search():
    args = {}
    if request.args.get('submit'):
        for key in FilterForm.arg_keys:
            if key in FilterForm.arg_keys\
                    and request.args.get(key)\
                    and (request.args.get(key) != '0'):
                args[key] = request.args.get(key)
    return redirect(
        url_for(
            "main.catalog",
            **args
        )
    )


@bp.route("/")
@bp.route("/catalog")
def catalog():
    args = {
        x[0]: x[1]
        for x in request.args.items()
        if x[0] in FilterForm.arg_keys
    }
    form = FilterForm()
    with DB() as db:
        form.subway_station_id.choices += db.execute(
            db.get_sql_query(
                'get_all_subway_stations'
            )
        )
    for key in args:
        getattr(form, key).data = int(request.args.get(key))

    with DB() as db:
        objs = db.execute(
            db.get_sql_query_with_filter(
                'get_all_objects',
                params=args
            )
        )

    return render_template(
        "catalog/index.html",
        form=form,
        objs=objs,
        len_array=len(objs)
    )
