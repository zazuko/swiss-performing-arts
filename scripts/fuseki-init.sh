#!/bin/sh
#docker run -p 3030:3030 --name fuseki-spa -e ADMIN_PASSWORD=cinderella -d stain/jena-fuseki
#sleep 20
source scripts/env.sh
curl -u admin:cinderella --data "dbType=tdb&dbName=spa"  http://$FUSEKI_HOST:3030/$/datasets
curl -X PUT -u admin:cinderella -T target/STS/Entwuerfe.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/Masken.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/Modelle.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/Plakate.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/RepProfi.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/stc_amateur_theatre_companies.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/stc_anniversary_performing_arts_festivals.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/stc_circuses.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/stc_outdoor_theatre_events.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/stc_performing_arts_festivals.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/stc_professional_performing_arts_companies.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/stc_puppet_theatre_companies.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts
curl -X POST -u admin:cinderella -T target/STS/stc_revues_cultural_nights_vorfasnacht.nt -G -H "Content-Type: application/n-triples" http://admin:cinderella@$FUSEKI_HOST:3030/spa/data --data-urlencode graph=http://example.com/sts

