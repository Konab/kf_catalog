from flask_wtf import FlaskForm
from wtforms import IntegerField, SelectField, SubmitField
from flask_wtf.html5 import NumberInput


class FilterForm(FlaskForm):
    area_min = IntegerField("Площадь от", widget=NumberInput())
    area_max = IntegerField("Площадь до", widget=NumberInput())
    floor = IntegerField("Этаж", widget=NumberInput())
    subway_station_id = SelectField(
        "Метро", coerce=int, choices=[(0, "- Не выбрано")], default=0)
    submit = SubmitField("Применить")
    clear = SubmitField("Сбросить")

    arg_keys = [
        'area_min',
        'area_max',
        'floor',
        'subway_station_id'
    ]
