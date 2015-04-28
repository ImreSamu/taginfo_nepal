#!/bin/bash
set -e

logfile="/tmp/taginfo_job_$(date +%Y-%m-%d_%H:%M).log"
exec > $logfile 2>&1

L=/tmp/taginfo.trace.log

( date  --rfc-3339=ns ; echo Start ) >> $L

cd /osm/

( date  --rfc-3339=ns ; echo "Downloading osm data from geofabrik" ) >> $L
/osm/taginfo_download.sh

( date  --rfc-3339=ns ; echo ".... (cut admin_level Nepal)" ) >> $L
/osm/taginfo_cut.sh

( date  --rfc-3339=ns ; echo "Processing taginfo " ) >> $L   
/osm/taginfo_dataload.sh

( date  --rfc-3339=ns ; echo "Restart Apache2 service" ) >> $L   
/usr/sbin/service apache2 restart

( date  --rfc-3339=ns ; echo "Done, gone." ) >> $L   
