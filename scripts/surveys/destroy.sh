#!/bin/bash
# sh scripts/surveys/destroy.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="ra2knLJVDZYOn15aNYuv8neaFyySnIj45s6TvxwD7WI=--tZvkZoQM3eW9Q3FeLH4HBSOIy/4ubfvhmhjlqLww9Ik="
ID="591cf6f036f22b74eb014bdd"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
