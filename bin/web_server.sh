#!/bin/sh

export ORM_DRIVER="sqlite"
export UMEMPOOL="581,0,0,59,16409,-7,-20,-23,31"
export ORM_OPTION="host=localhost user=benchmarkdbuser password=benchmarkdbpass character-set=utf8 dbname=../db/fortune"

export UTRACE="0 20M 0"
export UTRACE_SIGNAL="0 20M 0"
#UOBJDUMP="0 10M 100"
#USIMERR="error.sim"

#printenv

(cd ../log && exec userver_tcp -c ../etc/userver.cfg)


