#!/bin/bash
# sh scripts/surveys/update.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="m16cudiL2QvtLo7AwElq9fc5oNOsITK2ygKMQFaiXzo=--iazGROTbxWZr4ckUZichiCYJINo3N2OVVDXAzbuwd/U="
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
