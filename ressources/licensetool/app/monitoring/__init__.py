from apiflask import APIBlueprint

from app.monitoring import routes

bp = APIBlueprint('monitoring', __name__)

