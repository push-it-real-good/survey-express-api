#!/bin/sh
# sh scripts/responses/index.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="RvHF5bzEyWoQc2UH55fPfvjF9qSENEBhkMtbyByNk5o=--oKqLYGKgjGOpOoQvzGgRzz1gC3oemmL8j4biTzbhIiQ="
# ID="591b566e6c7cec38cd43e05f"
SURVEYID="591dc78cc049172c119e0551"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
      "survey_id": "'"${SURVEYID}"'"
  }'

echo
