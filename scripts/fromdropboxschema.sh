#!/bin/sh
source scripts/env.sh
./node_modules/xlsx/bin/xlsx.njs $DROPBOX/SPA_Data_Model_Attributes_20170904.xlsx -o input/SPA_Attributes.csv
./node_modules/xlsx/bin/xlsx.njs $DROPBOX/SPA_Data_Model_Classes_export_20170828.xlsx -o input/SPA_Classes.csv
./node_modules/xlsx/bin/xlsx.njs $DROPBOX/SPA_Data_Model_Qualifiers_20170904.xlsx -o input/SPA_Qualifiers.csv
./node_modules/xlsx/bin/xlsx.njs $DROPBOX/SPA_Data_Model_Relations_20170904.xlsx -o input/SPA_Relations.csv
