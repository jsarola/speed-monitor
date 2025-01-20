FROM apache/superset:latest

USER root

RUN apt-get update && apt-get -y install build-essential libssl-dev libffi-dev python3-dev python3-pip libsasl2-dev libldap2-dev libpq-dev git cmake

RUN pip3 install --upgrade setuptools pip
RUN pip3 install psycopg2-binary

ENV ADMIN_USERNAME=$ADMIN_USERNAME
ENV ADMIN_EMAIL=$ADMIN_EMAIL
ENV ADMIN_PASSWORD=$ADMIN_PASSWORD

COPY ./superset-init.sh /superset-init.sh

COPY ./superset_config.py /app/superset_config.py
COPY ./dashboard.json /app/dashboard.json

ENV SUPERSET_CONFIG_PATH=/app/superset_config.py

USER superset
ENTRYPOINT [ "/superset-init.sh" ]

