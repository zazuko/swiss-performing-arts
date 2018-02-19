#!/bin/sh
source scripts/env.sh
./node_modules/xlsx/bin/xlsx.njs $DROPBOX/SPA_Data_Model_Attributes_current.xlsx -o input/SPA_Attributes.csv
./node_modules/xlsx/bin/xlsx.njs $DROPBOX/SPA_Data_Model_Classes_current.xlsx -o input/SPA_Classes.csv
./node_modules/xlsx/bin/xlsx.njs $DROPBOX/SPA_Data_Model_Qualifiers_current.xlsx -o input/SPA_Qualifiers.csv
./node_modules/xlsx/bin/xlsx.njs $DROPBOX/SPA_Data_Model_Relations_current.xlsx -o input/SPA_Relations.csv
