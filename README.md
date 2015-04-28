

#NEPAL taginfo  
setup for brand new **Ubuntu 14.04** 

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


