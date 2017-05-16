#!/bin/bash
# sh scripts/surveys/create.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
# ID="591b466789660e287b76551c"
TITLE="first survey"
URL="http://url.com/survey/g25jfasow7435q7043275rg473928762"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "survey": {
      "title": "'"${TITLE}"'",
      "url": "'"${URL}"'"
    }
  }'

echo
