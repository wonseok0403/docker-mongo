FROM frodenas/ubuntu
MAINTAINER Wonseok.J


# Install MongoDB 3.0
RUN DEBIAN_FRONTEND=noninteractive && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
    echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.0.list && \
    apt-get update && \
    apt-get install -y --force-yes mongodb-org=3.0.7 mongodb-org-server=3.0.7 mongodb-org-shell=3.0.7 mongodb-org-mongos=3.0.7 mongodb-org-tools=3.0.7 && \
    service mongod stop && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# Add scripts 
ADD ./scripts /scripts
run chmod +x /scripts/*
RUN touch /.firstrun


ENTRYPOINT ["/scripts/run.sh"]
CMD [""]

EXPOSE 27017
EXPOSE 28017
