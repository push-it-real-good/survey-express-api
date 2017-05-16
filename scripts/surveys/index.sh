#!/bin/sh
# sh scripts/surveys/index.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
# ID="591b466789660e287b76551c"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
