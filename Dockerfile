FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    ca-certificates \
    apt-transport-https \
    iproute2 \
    iptables \
    && wget -qO /etc/apt/trusted.gpg.d/nordvpn_public.asc https://repo.nordvpn.com/gpg/nordvpn_public.asc \
    && echo "deb https://repo.nordvpn.com/deb/nordvpn/debian stable main" > /etc/apt/sources.list.d/nordvpn.list

RUN apt-get update && apt-get install -y nordvpn && apt-get clean

RUN mkdir -p /run/nordvpn && chown -R root:nordvpn /run/nordvpn

RUN mkdir -p /run/nordvpn
#Initialize nordvpn daemon
RUN /etc/init.d/nordvpn start 

WORKDIR /usr/local/bin
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT [ "/usr/local/bin/entrypoint.sh" ]