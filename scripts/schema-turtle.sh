#!/bin/sh
cat input/prefix.ttl target/schema.nt| rapper -i turtle -o turtle - http://vocab.performing-arts.ch/ > schema/schema.ttl