FROM mongo

LABEL mantainer=luis122448
LABEL email=luis122448gmail

WORKDIR /opt

# Instalación de cron
RUN apt-get update && apt-get install -y cron

COPY ./init-scripts /opt/docker-entrypoint-initdb.d
COPY ./configurations /opt/docker-entrypoint-initdb.ds
COPY ./configurations /opt/configurations

EXPOSE 27017