#!/bin/bash
# sh scripts/questions/update.sh

API="http://localhost:4741"
URL_PATH="/questions"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
ID="591b528a73163436ff31a147"

QN="1"
TEXT="blue or yellow?"
SURVEYID="591b466789660e287b76551c"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "question": {
      "question_no": "'"${QN}"'",
      "text": "'"${TEXT}"'",
      "survey_id": "'"${SURVEYID}"'"
    }
  }'

echo
