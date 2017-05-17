#!/bin/sh
# sh scripts/responses/show.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="KNUySxDe/SgD3FBeFgczZjUqvXvWFR6Bb6TBIxb4MhE=--JRLOoQvIhIoHLZtmKlW/kwROOo8/SAKtBSn7kxQ0TFc="
# ID="591c54897045c031dfd5aede"
ID="591b466789660e287b76551c"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
