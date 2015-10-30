FROM tomcat:8

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

RUN apt-get -y update && apt-get -y install vim libmysql-java apache2 mysql-client zip

RUN wget https://bitbucket.org/art-uniroma2/vocbench/downloads/VOCBENCH_2.2.zip

#commented as we use semantic-turkey version in bundle with VOCBENCH 
#RUN wget https://bitbucket.org/art-uniroma2/semantic-turkey/downloads/semanticturkey-0.11-system-patch.zip

#RUN rm -r $CATALINA_HOME/webapps/*

RUN unzip VOC*.zip -d /tmp 
#RUN cp /tmp/VOC*/vocbench.war $CATALINA_HOME/webapps/vocbench.war
RUN unzip /tmp/VOC*/semantic* -d /tmp 
#RUN mv /tmp/semantic* /opt/semanticturkey

#RUN cp /tmp/VOC*/*.war $CATALINA_HOME/webapps/
COPY entrypoint.sh /
COPY Config.properties /

#COPY ./entrypoint.sh $CATALINA_HOME/entrypoint.sh 

RUN chmod a+x /entrypoint.sh

#RUN chmod a+x /opt/semanticturkey/bin/st_server_run
#RUN chmod +x /opt/semanticturkey/*

EXPOSE 8080

#RUN sh $CATALINA_HOME/entrypoint.sh && tail -f /dev/null
ENTRYPOINT sh /entrypoint.sh

#WORKDIR $CATALINA_HOME

#CMD ["catalina.sh", "run"]

#:CMD /usr/sbin/apachectl -D FOREGROUND
