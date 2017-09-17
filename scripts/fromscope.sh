#!/bin/sh
source ./scripts/env.sh
mkdir -p target/STA
node $SCOPE2RDF/bin/cli -c input/STA/context.json -p input/STA/properties.json $DROPBOX/Daten_STA/20161117_xmlexport_scope_sta/20161117_xmlexport_dokumentation.xml > target/STA/xmlexport_dokumentation.jsonld 
node $SCOPE2RDF/bin/cli -c input/STA/context.json -p input/STA/properties.json $DROPBOX/Daten_STA/20161117_xmlexport_scope_sta/20161117_xmlexport_sammlung.xml > target/STA/xmlexport_sammlung.jsonld
node $SCOPE2RDF/bin/cli -c input/STA/context.json -p input/STA/properties.json $DROPBOX/Daten_STA/20161117_xmlexport_scope_sta/2016_11_16_archiv.xml > target/STA/archiv.jsonld 

