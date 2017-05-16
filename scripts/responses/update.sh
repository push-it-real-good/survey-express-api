#!/bin/bash

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="rBU2mhUoI1XVlNGKFlxEnFiapuUFcSlJ+rjWkOxeNAU=--A9+Fa6CmUQW3gjLh+VGQlygJsdJ2jjWlUuUsi11hSAI="
# ID="59148148682cb221b459fe62"

TEXT="GREEN"
SURVEYID="g25jfasow7435q7043275rg473928762"
QUESTIONID="g25jfasow7435q7043275rg473928762"
RESPONDENTID="g25jfasow7435q7043275rg473928762"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "response": {
      "text": "'"${TEXT}"'",
      "survey_id": "'"${SURVEYID}"'",
      "question_id": "'"${QUESTIONID}"'",
      "respondent_id": "'"${RESPONDENTID}"'"
    }
  }'

echo
