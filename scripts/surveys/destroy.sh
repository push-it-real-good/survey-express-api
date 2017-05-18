#!/bin/bash
# sh scripts/surveys/destroy.sh

API="http://localhost:4741"
URL_PATH="/surveys"

TOKEN="2NTrjFJveh6KF/WaT7l07XCFbXVmpnVAg7OdayIs7Z0=--3CbXHsZn705oSuIXiCT2ruraY5CXEs/DbyD23Bna4h8="
ID="591daf1d9d0bf21fb4d07d3e"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request DELETE \
  --header "Authorization: Token token=${TOKEN}"

echo
