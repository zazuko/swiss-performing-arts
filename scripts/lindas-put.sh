#!/bin/sh
ENDPOINT=${ENDPOINT:=http://localhost:5820/spa}
echo "Posting to endpoint: $ENDPOINT"
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/STS/complete.nt \
     -G $ENDPOINT \
     --data-urlencode graph=https://linked.opendata.swiss/graph/SPA/sts
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/STA/complete.nt \
     -G $ENDPOINT \
     --data-urlencode graph=https://linked.opendata.swiss/graph/SPA/tanzarchiv
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/schema.nt \
     -G $ENDPOINT \
     --data-urlencode graph=https://linked.opendata.swiss/graph/SPA/schema
