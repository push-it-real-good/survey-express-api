#!/bin/bash
# sh scripts/surveys/update.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
ID="591b466789660e287b76551c"

TITLE="Terry first survey - edited"
QUESTION="What is my questions ?"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "survey": {
      "title": "'"${TITLE}"'",
      "question": "'"${QUESTION}"'"
    }
  }'

echo
