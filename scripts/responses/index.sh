#!/bin/sh
# sh scripts/responses/index.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="dUim9y/Jlt3mDMwPo+qs1yzy+5eJJlFNNiq/kM8ZMt0=--RFecLpZ+BWQvM6kBH0UecTypOadd2ZOfYrm0iBQGsxc="
# ID="591b566e6c7cec38cd43e05f"
SURVEYID="591ca14bea0091c8a3783eb8"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN" \
  --data '{
      "survey_id": "'"${SURVEYID}"'"
  }'

echo
