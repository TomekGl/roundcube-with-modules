FROM roundcube/roundcubemail:1.7.7-apache

RUN set -ex; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        git unzip \
    ; \
    apt-get clean;

RUN set -ex; \
    \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist \
        --prefer-stable \
        --update-no-dev \
        --no-interaction \
        --optimize-autoloader \
        require \
            johndoh/contextmenu \
    ;
RUN set -ex; \
    \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist \
        --prefer-stable \
        --update-no-dev \
        --no-interaction \
        --optimize-autoloader \
        require \
            texxasrulez/advanced_search \
    ;
RUN set -ex; \
    \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --no-interaction \
        --optimize-autoloader \
        require \
            camilord/twofactor_gauthenticator:dev-master \
    ;
RUN set -ex; \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist --prefer-stable \
        --no-interaction \
        --optimize-autoloader --apcu-autoloader \
        require \
            r3c/custom-from \
    ;
RUN set -ex; \
    composer \
        --working-dir=/usr/src/roundcubemail/ \
        --prefer-dist --prefer-stable \
        --no-interaction \
        --optimize-autoloader --apcu-autoloader \
        require \
            kitist/html5_notifier \
    ;
