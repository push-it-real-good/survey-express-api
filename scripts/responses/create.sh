#!/bin/bash
# sh scripts/responses/create.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="ra2knLJVDZYOn15aNYuv8neaFyySnIj45s6TvxwD7WI=--tZvkZoQM3eW9Q3FeLH4HBSOIy/4ubfvhmhjlqLww9Ik="
# ID="591b566e6c7cec38cd43e05f"

TEXT="Terry is NOT the man!"
SURVEYID="591ced98552ca16fbe258bb6"

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
