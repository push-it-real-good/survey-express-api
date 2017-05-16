#!/bin/bash
# sh scripts/questions/destroy.sh

API="http://localhost:4741"
URL_PATH="/questions"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
ID="591b520489660e287b765522"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
