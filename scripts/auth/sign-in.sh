#!/bin/bash
# sh scripts/auth/sign-in.sh

API="http://localhost:4741"
URL_PATH="/sign-in"

EMAIL="TEST2"
PASSWORD="TEST"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'"
    }
  }'

echo
