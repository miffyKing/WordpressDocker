FROM debian:bullseye

RUN apt-get update \
       && apt-get upgrade -y \
       && apt-get install -y mariadb-server \
       && apt-get install mariadb-client \
       && apt-get install -y vim \
        && rm -rf /var/lib/apt/lists/*


RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY ./tools/setup.sh /setup.sh

RUN chmod +x /setup.sh && \
	rm -f /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/


ENTRYPOINT ["sh",  "/setup.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0"]


