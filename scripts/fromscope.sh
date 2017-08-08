source ./scripts/env.sh
node $SCOPE2RDF/bin/cli -c  $SCOPE2RDF/examples/context.json -p $SCOPE2RDF/examples/properties.json $TANZARCHIV/20161117_xmlexport_dokumentation.xml > target/STA/20161117_xmlexport_dokumentation.jsonld 
node $SCOPE2RDF/bin/cli -c  $SCOPE2RDF/examples/context.json -p $SCOPE2RDF/examples/properties.json $TANZARCHIV/20161117_xmlexport_sammlung.xml > target/STA/20161117_xmlexport_sammlung.jsonld
node $SCOPE2RDF/bin/cli -c  $SCOPE2RDF/examples/context.json -p $SCOPE2RDF/examples/properties.json $TANZARCHIV/2016_11_16_archiv.xml > target/STA/2016_11_16_archiv.jsonld 
