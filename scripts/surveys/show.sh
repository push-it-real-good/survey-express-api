#!/bin/sh
# sh scripts/surveys/show.sh
#
API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="Ra2knLJVDZYOn15aNYuv8neaFyySnIj45s6TvxwD7WI=--tZvkZoQM3eW9Q3FeLH4HBSOIy/4ubfvhmhjlqLww9Ik="

ID="591cf8eb24fd3475414f9e78"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
