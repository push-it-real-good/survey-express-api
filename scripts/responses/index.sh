#!/bin/sh
# sh scripts/responses/index.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="sVszRfskTfAsTk1bkDt+EVfZK2gYUh9sm6d49hTSA4g=--NoOulK8XHktFMK3QOPYrNO0EWCmd+Mqza9dXkjD7JzQ="
# ID="591b566e6c7cec38cd43e05f"
SURVEYID="591b466789660e287b76551c"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN" \
  --data '{"survey_id": "'"${SURVEYID}"'"}'

echo
