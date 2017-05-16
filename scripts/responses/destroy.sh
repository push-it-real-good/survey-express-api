#!/bin/bash

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="DlH5r+gduW0cVzx0FUo6jcKhJp6oimLOlMqQ9BZv0EU=--70WiqcCSMiqWzWtJoca3EVwEix/Md7skvcI8onzEq94="
ID="59148148682cb221b459fe62"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
