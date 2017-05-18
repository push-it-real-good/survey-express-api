#!/bin/bash
# sh scripts/surveys/create.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="ra2knLJVDZYOn15aNYuv8neaFyySnIj45s6TvxwD7WI=--tZvkZoQM3eW9Q3FeLH4HBSOIy/4ubfvhmhjlqLww9Ik="
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
