""" Main.py """
import logging.config
from http import HTTPStatus
from typing import Tuple

from flask import Response, jsonify, redirect
from werkzeug.wrappers.response import Response as WerkzeugResponse
from prometheus_client import CONTENT_TYPE_LATEST, generate_latest, multiprocess, CollectorRegistry

from app import create_app, config

logging.config.dictConfig(config.LOGGING_CONFIG)

app = create_app()


@app.route("/")
def redirect_to_swagger() -> WerkzeugResponse:
    """Main route redirects to swagger docs"""
    return redirect("/swagger")


@app.route("/apimetrics")
def metrics() -> Response:
    """ return application metrics """
    registry = CollectorRegistry()
    multiprocess.MultiProcessCollector(registry)
    data = generate_latest(registry)
    return Response(data, mimetype=CONTENT_TYPE_LATEST)


@app.route("/readinessprobe", methods=["GET"])
def readiness() -> Tuple[str, int]:
    """ Ready if cache is warm """
    return jsonify(message="APIis ready!"), HTTPStatus.OK.value


@app.route("/livelinesssignal", methods=["GET"])
def liveliness() -> Tuple[str, int]:
    """ Let the world know that the API is live """
    return jsonify(message="API is live!"), HTTPStatus.OK.value


if __name__ == "__main__":
    app.run(host="0.0.0.0", threaded=False, processes=4)
