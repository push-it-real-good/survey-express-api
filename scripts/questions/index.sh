#!/bin/sh
# sh scripts/questions/index.sh

API="http://localhost:4741"
URL_PATH="/questions"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
# ID="591b528a73163436ff31a147"

curl "${API}${URL_PATH}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
