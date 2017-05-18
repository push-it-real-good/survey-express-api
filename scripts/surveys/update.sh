#!/bin/bash
# sh scripts/surveys/update.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="ra2knLJVDZYOn15aNYuv8neaFyySnIj45s6TvxwD7WI=--tZvkZoQM3eW9Q3FeLH4HBSOIy/4ubfvhmhjlqLww9Ik="
ID="591d01b0061f847eb0d44ff1"

TITLE="Terry survey - edited again 333"
QUESTION="What is my questions ? 333"

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
