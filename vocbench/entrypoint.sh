#!/usr/bin/bash
set -e

mkdir /tmp/unzip
unzip /tmp/VOC*/voc*.war -d /tmp/unzip
cd /tmp/unzip
cp /Config.properties /tmp/unzip/WEB-INF/classes/Config.properties

zip -r vocbench.war .

cp /tmp/unzip/vocbench.war $CATALINA_HOME/webapps/vocbench.war

cp -R /tmp/semantic*/* /opt/semanticturkey/
chmod a+x /opt/semanticturkey/bin/st_server_run

exec $CATALINA_HOME/bin/catalina.sh run &

sleep 60

exec /opt/semanticturkey/bin/st_server_run &
exec tail -f /dev/null
