#!/bin/bash
# sh scripts/responses/create.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
# ID="591b566e6c7cec38cd43e05f"

TEXT="ok again"
SURVEYID="591b466789660e287b76551c"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "response": {
      "text": "'"${TEXT}"'",
      "survey_id": "'"${SURVEYID}"'"
    }
  }'

echo
