FROM alpine:latest
MAINTAINER MaxDuke <maxduke@gmail.com>

COPY root/ /

RUN set -xe \
	&& apk add --no-cache build-base openssl \
    && wget https://github.com/jech/polipo/archive/master.zip -O polipo.zip \
    && unzip polipo.zip \
    && cd polipo-master \
    && make \
    && install polipo /usr/local/bin/ \
    && cd .. \
    && rm -rf polipo.zip polipo-master \
    && mkdir -p /polipo/conf /usr/share/polipo/www /var/cache/polipo \
    && apk del build-base openssl
	&& chmod +x /init.sh

VOLUME ["/polipo/conf"]

ENTRYPOINT ["/init.sh"]
