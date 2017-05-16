#!/bin/bash

API="http://localhost:4741"
URL_PATH="/questions"


TOKEN="rBU2mhUoI1XVlNGKFlxEnFiapuUFcSlJ+rjWkOxeNAU=--A9+Fa6CmUQW3gjLh+VGQlygJsdJ2jjWlUuUsi11hSAI="
# ID="59148148682cb221b459fe62"
QN="1"
TEXT="Do you like RED or GREEN"
SURVEYID="g25jfasow7435q7043275rg473928762"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "question": {
      "question_no": "'"${QN}"'",
      "text": "'"${TEXT}"'",
      "survey_id": "'"${SURVEYID}"'"
    }
  }'

echo
