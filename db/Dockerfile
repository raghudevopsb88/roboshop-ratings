FROM docker.io/mysql:8.4.5
RUN microdnf update -y && microdnf clean all \
    && rm -rf /usr/lib/mysqlsh /usr/bin/mysqlsh /usr/local/bin/gosu
COPY schema.sql app-user.sql /db/
COPY run.sh /run.sh
RUN chmod +x /run.sh
ENTRYPOINT ["bash", "/run.sh"]
