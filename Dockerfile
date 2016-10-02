# nipisarev/web

FROM nipisarev/centos7:latest
MAINTAINER Nick Pisarev <nipisarev@gmail.com>

ADD repo-files /etc/yum.repos.d/

RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
RUN curl --silent --location https://rpm.nodesource.com/setup_6.x | bash -

RUN yum install -y \
    git \
    vim \
    nginx \
    nodejs \
    php70w-fpm \
    php70w \
    php70w-bcmath \
    php70w-pgsql \
    php70w-mysql \
    php70w-xml \
    php70w-cli \
    php70w-common \
    php70w-devel \
    php70w-intl \
    php70w-mbstring \
    php70w-mcrypt \
    php70w-pdo \
    php70w-process \
    php70w-soap \
    php70w-opcache \
    php70w-pecl-xdebug \
    php70w-pecl-redis \
    php-IDNA_Convert \

RUN yum -y groupinstall 'Development Tools' \
    && yum clean all

RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

RUN chkconfig php-fpm on \
    && chkconfig nginx on
