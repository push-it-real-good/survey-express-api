#!/bin/bash
# sh scripts/responses/update.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="rBU2mhUoI1XVlNGKFlxEnFiapuUFcSlJ+rjWkOxeNAU=--A9+Fa6CmUQW3gjLh+VGQlygJsdJ2jjWlUuUsi11hSAI="
ID="591b566e6c7cec38cd43e05f"

TEXT="Blue"
SURVEYID="591b466789660e287b76551c"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "response": {
      "text": "'"${TEXT}"'",
      "survey_id": "'"${SURVEYID}"'"
        }
  }'

echo
