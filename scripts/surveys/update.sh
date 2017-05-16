#!/bin/bash

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="rBU2mhUoI1XVlNGKFlxEnFiapuUFcSlJ+rjWkOxeNAU=--A9+Fa6CmUQW3gjLh+VGQlygJsdJ2jjWlUuUsi11hSAI="
ID="59148148682cb221b459fe62"
TITLE="Terry first survey - edited"
URL"http://url.com/survey/g25jfasow7435q7043275rg473928762"
SURVEYNO="g25jfasow7435q7043275rg473928762"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "survey": {
      "title": "'"${TITLE}"'",
      "url": "'"${URL}"'",
      "survey_no": "'"${SURVEYNO}"'"
    }
  }'

echo
