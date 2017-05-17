#!/bin/sh
# sh scripts/responses/show.sh

API="http://localhost:4741"
URL_PATH="/responses"

TOKEN="dUim9y/Jlt3mDMwPo+qs1yzy+5eJJlFNNiq/kM8ZMt0=--RFecLpZ+BWQvM6kBH0UecTypOadd2ZOfYrm0iBQGsxc="
# ID="591c54897045c031dfd5aede"
# Response ID
ID="591ca6f91cd3dcd2ee33d77b"

curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=$TOKEN"

echo
