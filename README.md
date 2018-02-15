# Sample data of Swiss-Performing-Arts archive

## Prerequisites

* [Node.js](https://nodejs.org/en/)
* [Apache Jena](https://jena.apache.org/) commandline tools
* [Serd](https://drobilla.net/software/serd) binary
* Unix tools: `grep` & `sed`

On MacOS you can install all dependencies by using [Homebrew](https://brew.sh/): `node`, `serd`, `jena`.

Alternatively you can execute the repository using Docker within an instance of the [Node-Java-Jena](https://hub.docker.com/r/zazukoians/node-java-jena/) image we provide.

## Usage

You can execute the whole pipeline by using `npm run`. Without any arguments you will get a list of all possible commands to execute. Note that you will have to adjust `scripts/env.sh` and point to the correct input directory from Dropbox.

To build everything, simply run `npm run build`.

If you want to run it on your own, this is the correct run order:

* `./scripts/fromscope.sh` -> transforms Scope XML export to RDF. Needs [scope-to-rdf](https://github.com/zazuko/scope-to-rdf) repository installed on the system. Adjust `scripts/env.sh` accordingly.
* `./scripts/fromdropbox.sh` -> Puts the data from the Dropbox share into the right place. Adjust `scripts/env.sh` accordingly.
* `./scripts/fromdropboxschema.sh` -> Converts the Excel schema files from Dropbox to CSV and puts them into the right place. Adjust `scripts/env.sh` accordingly.
* `npm install` -> installs the dependencies for the CSV conversion script
* `node index.js` -> converts all CSV files to RDF
* `./scripts/tdb-load.sh` -> Loads all RDF files into Fuseki.
* `./scripts/tdb-update.sh` -> Executes a whole bunch of cleanup scripts in Fuseki.
* `./scripts/tdb-dump.sh` -> Gets the cleaned-up data from Fuseki and writes them into `target` directory.
* `./scripts/lindas-put.sh` -> puts everything into the LINDAS platform. Cannot be executed without proper user.
