FROM nginx:1.26.1

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources \
    && apt update \
    && apt install -y \
        logrotate \
        varnish \
        procps \
        lsof \
        ca-certificates \
    && rm -rf /var/lib/apt/lists/*

COPY varnish /etc/default/varnish
COPY nginx /etc/logrotate.d/nginx
COPY 50-start-ex-process.sh /docker-entrypoint.d/50-start-ex-process.sh

RUN chmod 755 /docker-entrypoint.d/50-start-ex-process.sh /etc/default/varnish \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
