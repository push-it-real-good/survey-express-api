#!/bin/bash
# sh scripts/responses/destroy.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="m1Zu7zjfKNXlW2HiaUKPf4QppjgWhBsg88P1vYWvDpw=--FBMpBW8XLRLzCOudD4NJLtyheJ1FDgce/rUxcdS7+lY="

SURVEYID="591ca14bea0091c8a3783eb8"
ID="591cb547ea461c604f955ee7"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
      "survey_id": "'"${SURVEYID}"'"
    }'

echo
