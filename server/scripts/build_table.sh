#!/bin/bash
ROOTDIR=`cd $(dirname $0); pwd`

cd $ROOTDIR/mysql2record

erlc -I ./mysql.hrl ./mysql/mysql.erl 
erlc ./mysql/mysql_auth.erl
erlc ./mysql/mysql_conn.erl
erlc ./mysql/mysql_recv.erl

erlc ./erlydb/erlydb.erl
erlc ./erlydb/erlsql.erl
erlc ./erlydb/erlydb_base.erl
erlc ./erlydb/erlydb_field.erl
erlc ./erlydb/erlydb_mysql.erl
erlc ./erlydb/smerl.erl

erlc -I ./conf_table.hrl ./mysql2record.erl

erl +P 1024000 -smp disable -name goddess_mysql@127.0.0.1 -s mysql2record start -s erlang halt

cd $ROOTDIR

#chmod a-w $ROOTDIR/../include/table_record.hrl

echo "finished"

