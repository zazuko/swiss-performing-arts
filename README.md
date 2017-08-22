# Sample data of Swiss-Performing-Arts archive

## Build (in that order)

* `./scripts/docker.sh` -> will pull & run a Fuseki docker container & configure it. Needs a working Docker environment.
* `./scripts/fromscope.sh` -> transforms Scope XML export to RDF. Needs [scope-to-rdf](https://github.com/zazuko/scope-to-rdf) repository installed on the system. Adjust `scripts/env.sh` accordingly.
* `./scripts/fromdropbox.sh` -> Puts the data from the Dropbox share into the right place. Adjust `scripts/env.sh` accordingly.
* `./scripts/fromdropboxschema.sh` -> Converts the Excel schema files from Dropbox to CSV and puts them into the right place. Adjust `scripts/env.sh` accordingly.
* `npm install` -> installs the dependencies for the CSV conversion script
* `node index.js` -> converts all CSV files to RDF
* `./scripts/fuseki-init.sh` -> Loads all RDF files into Fuseki.
* `./scripts/fuseki-construct.sh` -> Executes a whole bunch of cleanup scripts in Fuseki.
* `./scripts/fuseki-get.sh` -> Gets the cleaned-up data from Fuseki and writes them into `target` directory.
* `./scripts/lindas-put.sh` -> puts everything into the LINDAS platform. Cannot be executed without proper user.
