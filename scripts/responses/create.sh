#!/bin/bash
# sh scripts/responses/create.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="J2Rs0QpflfWbWjXO4zd4DqbfNmKwIbCrsT6UGTUuQug=--A7LqPBnw6+uVKtf5b8pcFsGEtFrdz6bVqH6HuCoJbE8="
# ID="591b566e6c7cec38cd43e05f"

TEXT="Hell yeah !"
SURVEYID="591dbdd4ea4ff7267749a402"

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
