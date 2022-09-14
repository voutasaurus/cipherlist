FROM node:carbon-alpine
RUN     apk update \
    &&  apk add nginx bind-tools curl wget nmap nmap-scripts procps tcpdump busybox-extras mtr openssh-client postgresql-client mysql-client rsync jq git iputils lftp netcat-openbsd socat iproute2 net-tools bash perl-net-telnet iperf3 ethtool apache2-utils vim redis

RUN curl -O https://svn.nmap.org/nmap/scripts/ssl-enum-ciphers.nse

ENTRYPOINT ["nmap", "-sV", "--script", "ssl-enum-ciphers", "-p", "443"]
