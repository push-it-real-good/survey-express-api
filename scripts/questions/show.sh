#!/bin/sh

API="http://localhost:4741"
URL_PATH="/questions"

TOKEN="sVszRfskTfAsTk1bkDt+EVfZK2gYUh9sm6d49hTSA4g=--NoOulK8XHktFMK3QOPYrNO0EWCmd+Mqza9dXkjD7JzQ="
ID="5914a54f21fcf92cc6d12e6c"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
