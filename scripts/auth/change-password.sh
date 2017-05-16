#!/bin/bash

API="http://localhost:4741"
URL_PATH="/change-password"

TOKEN="i51hh/+E45xuGZqXz6feAP0CK9vBWW2Edd77ACBjiHc=--O4n5z1AA61O7hKMF11dtFUxewIvM890l+Frna4SlFSg="
ID="591b09f641c20fa34babe275"
OLDPW="TEST1"
NEWPW="TEST"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Authorization: Token token=${TOKEN}" \
  --header "Content-Type: application/json" \
  --data '{
    "passwords": {
      "old": "'"${OLDPW}"'",
      "new": "'"${NEWPW}"'"
    }
  }'

echo
