FROM buildpack-deps:stable-scm
LABEL maintainer="Michele Bologna <github@michelebologna.net>"
LABEL name="BitlBee Docker container by Michele Bologna"
LABEL version="mb-3.6-20201026"

ENV BITLBEE_VERSION=3.6

COPY build.sh /root
RUN /root/build.sh

VOLUME ["/usr/local/etc/bitlbee"]
VOLUME ["/var/lib/bitlbee"]
EXPOSE 6667
CMD ["/usr/local/sbin/bitlbee", "-c", "/usr/local/etc/bitlbee/bitlbee.conf", "-n", "-v"]
USER bitlbee
