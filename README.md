

#NEPAL taginfo  
setup for brand new **Ubuntu 14.04** and a **minimum 4Gb RAM**
* Taginfo instance showing tagging statistics only for NEPAL. 
* Input Data : Geofabrik 30min extract.  ( http://labs.geofabrik.de/nepal/ )
* Setup created for DigitalOcean ( 4Gb RAM, 60Gb Disk, Ubuntu 14.04 )
* Latest Taginfo source code :   https://github.com/joto/taginfo 
  ( map and overpass-turbo link is working ;  and  min_count_tags = 1  )

##Install steps:
* 1. copy all source files to  /osm
* 2. check the files   ls -l /osm/*.sh
* 3. run the setup steps.
```sh
 cd /osm 
 ./setup_step_00.sh
 ./setup_step_01.sh
 ./job_taginfo.sh
```
* 3. check website
* 4. schedule  /osm/job_taginfo.sh with crontab  

##more info:
* background info: http://wiki.openstreetmap.org/wiki/2015_Nepal_earthquake
* taginfo source code  : https://github.com/joto/taginfo
* source of Nepal flag : http://vathanx.deviantart.com/art/World-Flag-Icons-PNG-108083900


