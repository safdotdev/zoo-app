#!/bin/bash

curl -X POST https://test.pact.dius.com.au/webhooks/provider/Animal%20Service/consumer/Zoo%20App -u 'dXfltyFMgNOFZAxr8io9wJ37iUpY42M:O5AIZWxelWbLvqMd8PkAVycBJh2Psyg1' -d@script/webhook-trigger-provider-build.json -H "Content-Type: application/json" -H "Accept: application/hal+json"
#curl -X POST http://localhost:9292/webhooks/provider/Animal%20Service/consumer/Zoo%20App -d@script/webhook-trigger-provider-build.json -H "Content-Type: application/json" -H "Accept: application/hal+json"
