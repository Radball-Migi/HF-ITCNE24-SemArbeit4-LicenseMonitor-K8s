from apiflask import APIBlueprint, Schema
from apiflask.fields import Integer as APIInteger
from apiflask.fields import String as APIString
from apiflask.validators import Length
from sqlalchemy import Column, ForeignKey, Table
from sqlalchemy import Integer as sa_Integer
from sqlalchemy import String as sa_String
from sqlalchemy.orm import relationship

from app.extensions import db


class LicenseModel(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(32))
    count = db.Column(db.Integer)

# Eingabe-Schema
class LicenseIn(Schema):
    name = APIString(required=True, validate=Length(min=1, max=32))
    count = APIInteger(required=True)

# Ausgabe-Schema
class LicenseOut(Schema):
    id = APIInteger()
    name = APIString()
    count = APIInteger()

class LicenseStatusOut(Schema):
    skuid = APIString(required=True)
    skupartnumber = APIString(required=True)
    consumed_units = APIInteger(required=True)
    available_units = APIInteger(required=True)
    free_units = APIInteger(required=True)

class LicenseStatusAllOut(Schema):
    skuid = APIString(required=True)
    skupartnumber = APIString(required=True)
    consumed_units = APIInteger(required=True)
    available_units = APIInteger(required=True)
    free_units = APIInteger(required=True)
    tenant = APIString(required=True)
