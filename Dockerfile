FROM conyac/base:ubuntu20170417.1

COPY scripts /etc/mysql/scripts/
RUN /etc/mysql/scripts/build.sh

VOLUME  ["/var/lib/mysql"]

EXPOSE 3306
CMD ["/etc/mysql/scripts/setup.sh"]

