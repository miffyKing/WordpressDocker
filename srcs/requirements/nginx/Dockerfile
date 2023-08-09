FROM debian:buster

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y nginx openssl && \
    mkdir -p /etc/ssl
    
COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./tools/setup.sh /setup.sh

RUN chmod +x setup.sh

EXPOSE 443

ENTRYPOINT ["sh", "/setup.sh"]
