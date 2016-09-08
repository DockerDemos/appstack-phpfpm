FROM centos:centos7
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV PHP='php56u-fpm php56u-gd php56u-ldap php56u-mbstring php56u-mysql php56u-pdo php56u-pecl-memcache php56u-xml' \
    PHPCONF='/etc/php-fpm.d/www.conf' \
    SSMTP='ssmtp'

ADD ius.repo /etc/yum.repos.d/ius.repo
ADD epel.repo /etc/yum.repos.d/epel.repo

RUN yum install -y $PHP $SSMTP \
    && yum clean all \
    && useradd -u 48 -U --home /var/www -M --shell /sbin/nologin apache \
    && usermod -a -G php-fpm apache
    # ^ Session dir Defaults to root.php-fpm, apache can't write

RUN sed -i '/^listen\ =\ 127.0.0.1/c\listen = 9000' $PHPCONF \
    && sed -i '/^listen.allowed_clients/c\; listen.allowed_clients = ' $PHPCONF \
    && sed -i '/^expose_php = On/c\expose_php = Off' $PHPCONF \
    && sed -i '/^user = php-fpm/c\user = apache' $PHPCONF \
    && sed -i '/^group = php-fpm/c\group = apache' $PHPCONF \
    && sed -i '/^;access.log = log\/$pool.access.log/c\access.log = /var/log/php-fpm/access.log' $PHPCONF 


ADD ssmtp-config.sh /ssmtp-config.sh

RUN mkdir -p /etc/service/phpfpm
ADD phpfpm.run /etc/service/phpfpm/run
RUN chmod -R a+x /etc/service/phpfpm /ssmtp-config.sh

EXPOSE 9000

ENTRYPOINT [ "/etc/service/phpfpm/run" ]
