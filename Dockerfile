# ------------------------------------------
# Environment: ubuntu 18.04
# Minimum Panel Version: 1.0
#
# A SneakyHub Fork Egg (Forked but Modified)
# ------------------------------------------

FROM ubuntu:18.04

# File Author / Maintainer
LABEL author="SneakyHub" maintainer="sneaky@sneakyhub.com"
ENV   DEBIAN_FRONTEND noninteractive

## add container user
RUN   useradd -m -d /home/container -s /bin/bash container

## update base packages
RUN   apt update \
 &&   apt upgrade -y

## install dependencies
RUN   apt install -y gcc g++ libgcc1 lib32gcc1 gdb libc6 libstdc++6 git wget curl tar zip unzip binutils xz-utils liblzo2-2 bzip2 zlib1g iproute2 net-tools netcat telnet libatomic1 libsdl1.2debian libsdl2-2.0-0 \
      libfontconfig libicu60 libiculx60 icu-devtools libunwind8 libssl1.0.0 libssl1.0-dev sqlite3 libsqlite3-dev libmariadbclient-dev libduktape202 libzip4 locales ffmpeg apt-transport-https init-system-helpers \
      libcurl3-gnutls libjsoncpp1 libleveldb1v5 liblua5.1-0 libluajit-5.1-2 libsqlite3-0 apache2
      

#change working directory to root of apache webhost
WORKDIR var/www/html

#now start the server
CMD ["apachectl", "-D", "FOREGROUND"]
      
## configure locale
RUN   update-locale lang=en_US.UTF-8 \
 &&   dpkg-reconfigure --frontend noninteractive locales

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/bash", "/entrypoint.sh"]

#ENTRYPOINT ["/usr/sbin/apache2", "-k", "start"]


#ENV APACHE_RUN_USER www-data
#ENV APACHE_RUN_GROUP www-data
#ENV APACHE_LOG_DIR /var/log/apache2

EXPOSE 27020
CMD apachectl -D FOREGROUND
