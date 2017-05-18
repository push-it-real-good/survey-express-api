#!/bin/bash
# sh scripts/surveys/create.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="2NTrjFJveh6KF/WaT7l07XCFbXVmpnVAg7OdayIs7Z0=--3CbXHsZn705oSuIXiCT2ruraY5CXEs/DbyD23Bna4h8="
# ID="591b466789660e287b76551c"
TITLE="first survey"
QUESTION="What is my questions ?"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "survey": {
      "title": "'"${TITLE}"'",
      "question": "'"${QUESTION}"'"
    }
  }'

echo
