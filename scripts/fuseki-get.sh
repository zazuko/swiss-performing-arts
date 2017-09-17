#!/bin/sh
mkdir -p target/STS
curl -G -H "Accept: application/n-triples" -o target/STA/complete.nt http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/tanzarchiv
curl -G -H "Accept: application/n-triples" -o target/STS/temp.nt http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -G -H "Accept: application/n-triples" -o target/schema.nt http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/schema
cat target/STS/temp.nt | sed '/<undefined>/d' > target/STS/complete.nt
rm target/STS/temp.nt