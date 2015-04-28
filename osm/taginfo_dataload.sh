#!/bin/bash

L=/tmp/taginfo.trace.log


mkdir -p /osm/taginfo_build/projects/
cd /osm/taginfo/sources/projects/
sudo ./update.sh  /osm/taginfo_build/projects/


cd /osm/taginfo/sources
./update_all.sh  /osm/taginfo_build

mylog=$(find /osm/taginfo_build/log  -type f -mmin -300 | sort -r |  head -n 1 )
echo mylog = $mylog

OSMFILE=/osm/planet/var/latest.osm.pbf
if [ -f $OSMFILE ];
then
   echo "File $OSMFILE exists." 
   echo "File $OSMFILE exists."
else
   ( date  --rfc-3339=ns ; echo "error : File $OSMFILE does not exist "  ) >> $L
   echo "File $OSMFILE does not exist."
   exit 13
fi


if  grep -Fq 'Done update_all' $mylog ;then
   echo "OKE ($mylog) "
   mkdir /osm/data/old/ 2> /dev/null
   mv /osm/data/taginfo-* /osm/data/old/
   mv /osm/taginfo_build/ta*.db /osm/taginfo_build/*/ta*.db /osm/data
   mv /osm/taginfo_build/download/* /osm/download/
else   
   ( date  --rfc-3339=ns ; echo "error - error - error (check -> $mylog)"  ) >> $L
   echo "error - error - error (check -> $mylog)" 
fi







