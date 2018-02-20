#!/bin/sh

## Tanzarchiv STA

### Classes
tdbupdate --loc=target/tdb --update=construct/STA/Record-Collection.rq
tdbupdate --loc=target/tdb --update=construct/STA/Record-Recordset.rq
tdbupdate --loc=target/tdb --update=construct/STA/Record-CulturalHeritageObject.rq
tdbupdate --loc=target/tdb --update=construct/STA/Record-AnalogCopy.rq
tdbupdate --loc=target/tdb --update=construct/STA/Record-DigitalResource.rq
tdbupdate --loc=target/tdb --update=construct/STA/Record-Item.rq

## Properties

### Concept generation & cleanup

tdbupdate --loc=target/tdb --update=construct/STA/hasLocation-Country.rq
tdbupdate --loc=target/tdb --update=construct/STA/associatedWith-CorporateBody.rq
tdbupdate --loc=target/tdb --update=construct/STA/associatedWith-DocumentaryForm.rq
tdbupdate --loc=target/tdb --update=construct/STA/associatedWith-Person.rq
tdbupdate --loc=target/tdb --update=construct/STA/skos.rq


## Theatersammlung STS

tdbupdate --loc=target/tdb --update=construct/STS/Entwuerfe-relations.rq
tdbupdate --loc=target/tdb --update=construct/STS/Masken-relations.rq
tdbupdate --loc=target/tdb --update=construct/STS/Modelle-relations.rq
tdbupdate --loc=target/tdb --update=construct/STS/PerformingArtsProduction-Genre.rq
tdbupdate --loc=target/tdb --update=construct/STS/PerformingArtsProduction-CorporateBody.rq
tdbupdate --loc=target/tdb --update=construct/STS/PerformingArtsProduction-Person.rq
tdbupdate --loc=target/tdb --update=construct/STS/PerformingArtsProduction-Performance.rq
tdbupdate --loc=target/tdb --update=construct/STS/PerformingArtsProduction-Season.rq
tdbupdate --loc=target/tdb --update=construct/STS/PerformingArtsProduction-relations.rq
tdbupdate --loc=target/tdb --update=construct/STS/Plakate-relations.rq
tdbupdate --loc=target/tdb --update=construct/STS/STC-relations.rq
tdbupdate --loc=target/tdb --update=construct/delete-blanknodes.rq
