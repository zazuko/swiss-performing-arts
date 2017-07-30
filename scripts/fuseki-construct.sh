#!/bin/sh
source scripts/env.sh

FUSEKI_UPDATE=http://$FUSEKI_HOST:3030/spa/update
function sparqlu { curl -H "Accept: text/turtle" --data-urlencode update@$1 $2 ; }

#echo $FUSEKI_UPDATE

# some INSERTs

## Classes


## Properties


## Concept generation & cleanup

sparqlu construct/STS/Entwuerfe-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/Masken-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/Modelle-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/PerformingArtsProduction-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/Plakate-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/STC-relations.rq $FUSEKI_UPDATE
sparqlu construct/delete-blanknodes.rq $FUSEKI_UPDATE
