#!/bin/sh

# Schema
tdbloader --loc=target/tdb --graph=http://example.com/schema target/SPA_Attributes.nt 
tdbloader --loc=target/tdb --graph=http://example.com/schema target/SPA_Classes.nt 
#tdbloader --loc=target/tdb --graph=http://example.com/schema target/SPA_Qualifiers.nt 
tdbloader --loc=target/tdb --graph=http://example.com/schema target/SPA_Relations.nt 
# Tanzarchiv
tdbloader --loc=target/tdb --graph=http://example.com/tanzarchiv target/STA/xmlexport_dokumentation.jsonld
tdbloader --loc=target/tdb --graph=http://example.com/tanzarchiv target/STA/xmlexport_sammlung.jsonld
tdbloader --loc=target/tdb --graph=http://example.com/tanzarchiv target/STA/archiv.jsonld
# Theatersammlung
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/Entwuerfe.nt 
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/Masken.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/Modelle.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/Plakate.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/RepProfi.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/stc_amateur_theatre_companies.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/stc_anniversary_performing_arts_festivals.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/stc_circuses.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/stc_outdoor_theatre_events.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/stc_performing_arts_festivals.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/stc_professional_performing_arts_companies.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/stc_puppet_theatre_companies.nt
tdbloader --loc=target/tdb --graph=http://example.com/sts target/STS/stc_revues_cultural_nights_vorfasnacht.nt
