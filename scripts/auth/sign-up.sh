#!/bin/bash
# sh scripts/auth/sign-up.sh

API="http://localhost:4741"
URL_PATH="/sign-up"

EMAIL="TEST2"
PASSWORD="TEST"
PASSWORD1="TEST"

curl "${API}${URL_PATH}" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --data '{
    "credentials": {
      "email": "'"${EMAIL}"'",
      "password": "'"${PASSWORD}"'",
      "password_confirmation": "'"${PASSWORD1}"'"
    }
  }'

echo
