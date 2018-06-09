#!/bin/bash

curl -X POST https://test.pact.dius.com.au//webhooks/provider/Animal%20Service/consumer/Zoo%20App -u 'dXfltyFMgNOFZAxr8io9wJ37iUpY42M:O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1' -d@script/webhook-changed-pact.json -H "Content-Type: application/json" -H "Accept: application/hal+json"
