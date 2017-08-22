#!/bin/sh
source scripts/env.sh

FUSEKI_UPDATE=http://$FUSEKI_HOST:3030/spa/update
function sparqlu { curl -H "Accept: text/turtle" --data-urlencode update@$1 $2 ; }

## Tanzarchiv STA

### Classes
sparqlu construct/STA/Record-Collection.rq $FUSEKI_UPDATE
sparqlu construct/STA/Record-Recordset.rq $FUSEKI_UPDATE
sparqlu construct/STA/Record-CulturalHeritageObject.rq $FUSEKI_UPDATE
sparqlu construct/STA/Record-AnalogCopy.rq $FUSEKI_UPDATE
sparqlu construct/STA/Record-DigitalResource.rq $FUSEKI_UPDATE
sparqlu construct/STA/Record-Item.rq $FUSEKI_UPDATE

## Properties

### Concept generation & cleanup

sparqlu construct/STA/hasLocation-Country.rq $FUSEKI_UPDATE
sparqlu construct/STA/associatedWith-CorporateBody.rq $FUSEKI_UPDATE
sparqlu construct/STA/associatedWith-DocumentaryForm.rq $FUSEKI_UPDATE
sparqlu construct/STA/associatedWith-Person.rq $FUSEKI_UPDATE
sparqlu construct/STA/skos.rq $FUSEKI_UPDATE


## Theatersammlung STS

sparqlu construct/STS/Entwuerfe-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/Masken-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/Modelle-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/PerformingArtsProduction-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/Plakate-relations.rq $FUSEKI_UPDATE
sparqlu construct/STS/STC-relations.rq $FUSEKI_UPDATE
sparqlu construct/delete-blanknodes.rq $FUSEKI_UPDATE
