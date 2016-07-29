# Docker container for a PHP-FPM application server 
# http://php.net
#

FROM centos:centos7
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV REPO http://dl.iuscommunity.org/pub/ius/stable/CentOS/\$releasever/\$basearch/
ENV PHP php56u-fpm php56u-gd php56u-ldap php56u-mbstring php56u-mysql php56u-pdo php56u-pecl-memcache php56u-xml
ENV PHPCONF /etc/php-fpm.d/www.conf
ENV SSMTP ssmtp

RUN echo -e "\
[ius]\n\
name=IUS Community Repository\n\
baseurl=$REPO\n\
enabled=1\n\
gpgcheck=0\n\
priority=1\n\
" >> /etc/yum.repos.d/ius.repo

RUN echo -e "\
[EPEL]\n\
name=Extra Packages for Enterprise Linux \$releasever - \$basearch\n\
#baseurl=http://download.fedoraproject.org/pub/epel/\$releasever/\$basearch\n\
mirrorlist=https://mirrors.fedoraproject.org/metalink?repo=epel-\$releasever&arch=\$basearch\n\
failovermethod=priority\n\
enabled=1\n\
gpgcheck=0\n\
" >> /etc/yum.repos.d/epel.repo

RUN yum install -y $PHP $SSMTP; yum clean all
RUN useradd -u 48 -U --home /var/www -M --shell /sbin/nologin apache

# Session dir Defaults to root.php-fpm, apache can't write
RUN usermod -a -G php-fpm apache

RUN sed -i '/^listen\ =\ 127.0.0.1/c\listen = 9000' $PHPCONF
RUN sed -i '/^listen.allowed_clients/c\; listen.allowed_clients = ' $PHPCONF
RUN sed -i '/^expose_php = On/c\expose_php = Off' $PHPCONF
RUN sed -i '/^user = php-fpm/c\user = apache' $PHPCONF
RUN sed -i '/^group = php-fpm/c\group = apache' $PHPCONF
RUN sed -i '/^;access.log = log\/$pool.access.log/c\access.log = /var/log/php-fpm/access.log' $PHPCONF

ADD run-phpfpm.sh /run-phpfpm.sh
ADD config-ssmtp.sh /config-ssmtp.sh

EXPOSE 9000

ENTRYPOINT [ "/run-phpfpm.sh" ]
