FROM php:8.2-fpm
LABEL Diogo Alves <diogo.alves@mdsystemweb.com.br>

COPY composer.phar /usr/local/bin/composer

# RUN touch .gitconfig

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash -

RUN apt-get update && apt-get install -y \
        cron \
        default-mysql-client \
        git \
        gnupg \
        gzip \
        libbz2-dev \
        libfreetype6-dev \
        libicu-dev \
        libjpeg62-turbo-dev \
        libmagickwand-dev \
        libmcrypt-dev \
        libonig-dev \
        libpng-dev \
        libsodium-dev \
        libssh2-1-dev \
        libwebp-dev \
        libxslt1-dev \
        libzip-dev \
        lsof \
        mailutils \
        msmtp \
            g++ \
        golang-go \
        git-core \
        nodejs \
        procps \
        vim \
        zip \
        nano \
    && rm -rf /var/lib/apt/lists/*

RUN pecl channel-update pecl.php.net && pecl install \
        imagick \
        redis \
        ssh2-1.3.1 \
    && pecl clear-cache \
    && rm -rf /tmp/pear

RUN docker-php-ext-configure \
        gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install \
        bcmath \
        bz2 \
        calendar \
        exif \
        gd \
        gettext \
        intl \
        mbstring \
        mysqli \
        opcache \
        pcntl \
        pdo_mysql \
        soap \
        sockets \
        sodium \
        sysvmsg \
        sysvsem \
        sysvshm \
        xsl \
        zip \
    && docker-php-ext-enable \
        imagick \
        redis \
        ssh2

### Install Mailhog
# ENV GOPATH /tmp
# RUN cd /tmp
# RUN go get github.com/mailhog/mhsendmail
# RUN cd /tmp/src/github.com/mailhog/mhsendmail/ && go build
# RUN cp /tmp/src/github.com/mailhog/mhsendmail/mhsendmail /usr/local/bin

# Configure
COPY php.ini /usr/local/etc/php/php.ini
COPY opcache.ini /usr/local/etc/php/conf.d/opcache.ini
# COPY php-fpm.conf /usr/local/etc/
# COPY .gitconfig /root/.gitconfig
# COPY id_rsa /root/.ssh/id_rsa
# COPY id_rsa.pub /root/.ssh/id_rsa.pub

RUN curl -O https://files.magerun.net/n98-magerun2.phar \
	&& mv n98-magerun2.phar /usr/bin/n98 \
	&& chmod +x /usr/bin/n98;

RUN npm install -g grunt-cli

#set folder owner for composer cache
# RUN useradd -m docker-m2
# RUN adduser docker-m2 root
# RUN composer config --global process-timeout 1500
# RUN composer config --global repo.packagist composer https://packagist.org

# Make sure the volume mount point is empty
RUN rm -rf /var/www/html/*

# ALIAS
RUN echo 'alias ci="composer install"' >> ~/.bashrc
RUN echo 'alias cup="composer update"' >> ~/.bashrc
RUN echo 'alias bm="bin/magento"' >> ~/.bashrc
RUN echo 'alias cf="bin/magento c:f"' >> ~/.bashrc
RUN echo 'alias cc="bin/magento c:c"' >> ~/.bashrc
RUN echo 'alias sdc="bin/magento s:d:c"' >> ~/.bashrc
RUN echo 'alias sup="bin/magento s:up"' >> ~/.bashrc
RUN echo 'alias ir="bin/magento index:reset"' >> ~/.bashrc
RUN echo 'alias ire="bin/magento index:reindex"' >> ~/.bashrc
RUN echo 'alias ssd="bin/magento setup:static-content:deploy --jobs=12 -f"' >> ~/.bashrc
RUN echo 'alias rmall="rm -rf generated/*; rm -rf var/*; rm -rf pub/static/*"' >> ~/.bashrc
RUN echo 'alias rmalls="rmall && cf && ssd && cf"' >> ~/.bashrc
RUN echo 'alias rmrf="cf && sup && sdc && ssd && ir && ire && cc && cf"' >> ~/.bashrc
RUN echo 'alias npxc="npx create-react-app"' >> ~/.bashrc

CMD ["php-fpm"]
