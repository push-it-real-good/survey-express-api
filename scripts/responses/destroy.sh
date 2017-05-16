#!/bin/bash
# sh scripts/responses/destroy.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="DlH5r+gduW0cVzx0FUo6jcKhJp6oimLOlMqQ9BZv0EU=--70WiqcCSMiqWzWtJoca3EVwEix/Md7skvcI8onzEq94="
ID="591b575e6c7cec38cd43e060"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
