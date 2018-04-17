# EastbourneBusStops
The location of bus stops in Eastbourne, East Sussex

## Generate the stops CSV file

Download the bus stops for East Sussex from naptan.app.dft.gov.uk/DataRequest/Naptan.ashx?format=csv&LA=150 then run Generate.R to create the CSV file

## Plot the stops on a map

Can plot the stops onto a map if you use the ggmap library. This assumes you have loaded the location of the bus stops into EastbourneStops

```R
library(ggmap)
eastbourne2_lvl13_map_g_str <- get_map(location = c(lon=0.2929012,  lat=50.7896285), zoom = 13)
ggmap(eastbourne2_lvl13_map_g_str, extent = "device") + geom_point(data=EastbourneStops, mapping=aes(y=Latitude, x=Longitude), color = "red", size = 2, show.legend=FALSE)
```

![Bus stops in Eastbourne]
(https://github.com/robertprice/EastbourneBusStops/blob/master/stops.png?raw=true)
