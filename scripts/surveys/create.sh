#!/bin/bash
# sh scripts/surveys/create.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="JlzgwmaXm482/ttO+dyuLmcxrg4vAMFeJ0wQgmaX+Bk=--7oicnzNCgQspCjot0kUzu91SShoj97GU25JisL0lsGs="
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
