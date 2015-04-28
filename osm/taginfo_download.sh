#!/bin/bash

cd /osm/planet/var/
rm latest.osm.pbf
wget -w 1m  --tries=42      http://labs.geofabrik.de/nepal/latest.osm.pbf






