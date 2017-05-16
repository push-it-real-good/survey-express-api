#!/bin/bash
# sh scripts/responses/create.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
# ID="591b566e6c7cec38cd43e05f"

TEXT="red"
SURVEYID="591b466789660e287b76551c"
QUESTIONID="591b528a73163436ff31a147"
RESPONDENTID="g25jfasow7435q7043275rg473928762"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "response": {
      "text": "'"${TEXT}"'",
      "survey_id": "'"${SURVEYID}"'",
      "question_id": "'"${QUESTIONID}"'",
      "respondent_id": "'"${RESPONDENTID}"'"
    }
  }'

echo
