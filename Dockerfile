FROM debian:stretch AS peach
MAINTAINER vh@thc.org

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade && apt-get -y install \
    coreutils apt-utils wget curl openssl ca-certificates bash-completion \
    joe vim nano \
    mono-complete \
    unzip p7zip \
    fping hping3 httping thc-ipv6 gdb \
    tcpdump wireshark-common \
    locales-all \
    && apt-get -y autoremove && rm -rf /var/lib/apt/lists/*

RUN mkdir /peach && cd /peach && \
    wget https://netcologne.dl.sourceforge.net/project/peachfuzz/Peach/3.1/peach-3.1.124-linux-x86_64-release.zip && \
    unzip peach-3.1.124-linux-x86_64-release.zip && \
    rm -f peach-3.1.124-linux-x86_64-release.zip

RUN echo 'alias joe="joe --wordwrap"' >> ~/.bashrc
RUN echo 'export PS1="[peach]$PS1"' >> ~/.bashrc

WORKDIR    /peach
ENV        IS_DOCKER="1"
ENV        PATH="$PATH:/peach"
ENV        DOCKER_PS1="docker[peach] \w # "
ENTRYPOINT ["/peach/peach"]
