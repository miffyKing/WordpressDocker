# 베이스 이미지로 Debian Buster를 선택합니다.
FROM debian:buster

# 작업 디렉토리를 /app으로 설정합니다. (필요에 따라 원하는 경로로 변경 가능합니다.)
WORKDIR /app

# 패키지 관리자를 업데이트하고 필요한 패키지를 설치합니다.
RUN apt-get update \
       && apt-get upgrade -y \
       && apt-get install -y mariadb-server \
       && apt-get install mariadb-client \
       && apt-get install -y vim \
        &&rm -rf /var/lib/apt/lists/*

       # 여기에 필요한 패키지를 추가하세요. 예를 들면: 

RUN mkdir -p /var/run/mysqld && \
    chown -R mysql:mysql /var/run/mysqld && \
    chmod 777 /var/run/mysqld

COPY ./tools/setup.sh /setup.sh
# Add 로도 copy 대신해 사용할 수 있는거 같은디

RUN chmod +x /setup.sh 
# +x 는 실행권한 부여한다는 뜻
# 컨테이너에서 실행할 명령을 정의합니다. (예: 실행할 애플리케이션, 명령어 등)
# CMD [ "bash" ]

EXPOSE 3306

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/


ENTRYPOINT sh /setup.sh

CMD ["mysqld", "--bind-address=0.0.0.0"]
