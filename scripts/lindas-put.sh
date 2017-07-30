#!/bin/sh
curl -n \
     -X PUT \
     -H Content-Type:application/n-triples \
     -T target/STS/complete.nt \
     -G https://test.lindas-data.ch:8443/lindas \
     --data-urlencode graph=https://linked.opendata.swiss/graph/SPA/sts
