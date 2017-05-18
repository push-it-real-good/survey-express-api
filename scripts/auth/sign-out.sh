#!/bin/bash

API="http://localhost:4741"
URL_PATH="/sign-out"

TOKEN="i51hh/+E45xuGZqXz6feAP0CK9vBWW2Edd77ACBjiHc=--O4n5z1AA61O7hKMF11dtFUxewIvM890l+Frna4SlFSg="
ID="591b09f641c20fa34babe275"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=$TOKEN"

echo
