""" config.py """
from typing import Dict, Any, List

import os
from datetime import timedelta

ES_HOST = os.getenv("ES_HOST", "http://elasticsearch:9200/")
ES_USE_SSL = bool(os.getenv("ES_USE_SSL", ""))
ES_DOC_TYPE = "_doc"

ES_RANKED_TOPICS_INDEX = os.getenv("ES_RANKED_TOPICS_INDEX", "1-ranked-topics")
ES_DEFAULT_TEASERLISTS_INDEX = os.getenv("ES_DEFAULT_TEASERLISTS_INDEX", "1-current-teaserlists")

REDIS_HOST = os.getenv("REDIS_HOST", "redis")
REDIS_PORT = int(os.getenv("REDIS_PORT", "6379"))

REGION = os.getenv("SAGEMAKER_REGION", "eu-west-3")
DYNAMO_ITEM_TABLE = os.getenv("DYNAMO_ITEM_TABLE", "item-features")
DYNAMO_ITEM_KEY = os.getenv("DYNAMO_ITEM_KEY", "short_id")
DYNAMO_SECONDARY_ITEM_KEY = os.getenv("DYNAMO_SECONDARY_ITEM_KEY", "article_id")
DYNAMO_SECONDARY_INDEX_NAME = os.getenv("DYNAMO_SECONDARY_INDEX_NAME", "article_id_index")
DYNAMO_USER_READ_VECTOR_TABLE = os.getenv("DYNAMO_USER_READ_VECTOR_TABLE", "user-features")
DYNAMO_USER_KEY = os.getenv("DYNAMO_USER_KEY", "user_id_with_changed_stuff")
DYNAMO_FOLLOWABLE_KEY = os.getenv("DYNAMO_FOLLOWABLE_KEY", "followable_id")
DYNAMO_SWIMLANES_TABLE = os.getenv("DYNAMO_SWIMLANES_TABLE", "swimlane-clusters-prod")
DYNAMO_SWIMLANES_KEY = os.getenv("DYNAMO_SWIMLANES_KEY", "cluster_id")
DYNAMO_SWIMLANES_SORT_KEY = os.getenv("DYNAMO_SWIMLANES_SORT_KEY", "position")
DYNAMO_SWIMLANES_SECONDARY_KEY = os.getenv("DYNAMO_SWIMLANES_SECONDARY_KEY", "swimlane_id")
DYNAMO_SWIMLANES_SECONDARY_INDEX_NAME = os.getenv(
    "DYNAMO_SWIMLANES_SECONDARY_INDEX_NAME", "swimlane_id"
)
DYNAMO_SWIMLANES_CLIENT_MAX_WORKERS = int(os.getenv("DYNAMO_SWIMLANES_CLIENT_MAX_WORKERS", "10"))

DEFAULT_SWIMLANE_LIMIT = 300
DEFAULT_SWIMLANE_ITEM_LIMIT = 100
DEFAULT_SWIMLANE_BRAND_FILTER: List = []
DEFAULT_SWIMLANE_SOURCE = None
SWIMLANE_TOP_N_CUTOFF = 250
S3_ENDPOINT_URL = os.getenv("S3_ENDPOINT_URL")
DYNAMODB_ENDPOINT_URL = os.getenv("DYNAMODB_ENDPOINT_URL")
SAGEMAKER_ENDPOINT_URL = os.getenv("SAGEMAKER_ENDPOINT_URL")

MAX_TIMEOUT_EXTERNAL_RANKINGS_IN_SECS = 1
EXTERNAL_RANKING_FOLLOWABLE_TYPE = "ranking"
EXTERNAL_RANKING_FOLLOWABLE_SOURCE = "curated"

NON_LIST_SWIMLANES_ENDPOINT_ARGUMENTS = [
    "limit",
    "item_limit",
    "image_url_only",
    "explicit_follows_only",
    "max_age_kind",
    "source_code",
    "model",
    "filter_duplicate_articles",
    "saliency_threshold",
]

LIST_SWIMLANES_ENDPOINT_ARGUMENTS = {
    "allowed_brands": {"http_alias": "brand", "client_config_alias": "allow_brands"},
    "allow_followables_types": {
        "http_alias": "allow_followables_types",
        "client_config_alias": "allow_followables_types",
    },
}
