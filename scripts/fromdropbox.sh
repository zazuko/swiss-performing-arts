#!/bin/sh
source scripts/env.sh
cp $DROPBOX/SourceDatasetsForDataMigration/STS_Entwuerfe.csv ./input/STS/Entwuerfe.csv
cp $DROPBOX/SourceDatasetsForDataMigration/STS_Masken.csv ./input/STS/Masken.csv
cp $DROPBOX/SourceDatasetsForDataMigration/STS_Modelle.csv ./input/STS/Modelle.csv
cp $DROPBOX/SourceDatasetsForDataMigration/STS_Plakate.csv ./input/STS/Plakate.csv
cp $DROPBOX/SourceDatasetsForDataMigration/STS_RepProfi.csv ./input/STS/RepProfi.csv
# datahub
cp $DROPBOX/SourceDatasetsForDataMigration/stc_amateur_theatre_companies.csv ./input/STS/stc_amateur_theatre_companies.csv
cp $DROPBOX/SourceDatasetsForDataMigration/stc_anniversary_performing_arts_festivals.csv ./input/STS/stc_anniversary_performing_arts_festivals.csv
cp $DROPBOX/SourceDatasetsForDataMigration/stc_circuses.csv ./input/STS/stc_circuses.csv
cp $DROPBOX/SourceDatasetsForDataMigration/stc_outdoor_theatre_events.csv ./input/STS/stc_outdoor_theatre_events.csv
cp $DROPBOX/SourceDatasetsForDataMigration/stc_performing_arts_festivals.csv ./input/STS/stc_performing_arts_festivals.csv
cp $DROPBOX/SourceDatasetsForDataMigration/stc_professional_performing_arts_companies.csv ./input/STS/stc_professional_performing_arts_companies.csv
cp $DROPBOX/SourceDatasetsForDataMigration/stc_puppet_theatre_companies.csv ./input/STS/stc_puppet_theatre_companies.csv
cp $DROPBOX/SourceDatasetsForDataMigration/stc_revues_cultural_nights_vorfasnacht.csv ./input/STS/stc_revues_cultural_nights_vorfasnacht.csv