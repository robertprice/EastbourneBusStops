# Download stops from NaPTAN - naptan.app.dft.gov.uk/DataRequest/Naptan.ashx?format=csv&LA=150
# The LA code for East Sussex where Eastborne is located is 140, codes for other local authorities can be found at
# http://naptan.app.dft.gov.uk/Reports/frmStopsSummaryReport

library(readr)
Stops <- read_csv("~/Downloads/NaPTAN140csv/Stops.csv",
    col_types = cols(CreationDateTime = col_datetime(format = "%Y-%m-%dT%H:%M:%S"),
        ModificationDateTime = col_datetime(format = "%Y-%m-%dT%H:%M:%S")))

# filter out only stops in Eastbourne.
EastbourneStops <- Stops[(Stops$ParentLocalityName=="Eastbourne" & !is.na(Stops$ParentLocalityName)) | (Stops$LocalityName=="Eastbourne" & !is.na(Stops$LocalityName)),]

# write these out to a fresh CSV file.
write.csv(EastbourneStops, file = "~/Desktop/EastbourneStops.csv", na="", row.names = FALSE)
