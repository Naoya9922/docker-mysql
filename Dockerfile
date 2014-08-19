FROM conyac/base

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server pwgen

RUN rm -rf /var/lib/mysql/*

# locale
RUN locale-gen ja_JP.UTF-8 && locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8

ADD my.cnf /etc/mysql/my.cnf
ADD create_admin.sh /create_admin.sh
ADD run.sh /run.sh
VOLUME  ["/etc/mysql", "/var/lib/mysql"]

EXPOSE 3306
CMD ["/run.sh"]

