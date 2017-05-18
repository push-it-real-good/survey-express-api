#!/bin/sh
# sh scripts/surveys/index.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="W6HIEbjIODbWdx+QXNhdUQ29onJ06f8QpLE0vUpJsw4=--+qJHxaE6XQgagAhIxMuzBYFBafuZDaEYiBRejh5KEcM="
# ID="591b466789660e287b76551c"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
