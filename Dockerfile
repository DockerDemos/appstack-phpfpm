# Docker container for a PHP-FPM application server 
# http://php.net
#

FROM centos:centos7
MAINTAINER Chris Collins <collins.christopher@gmail.com>

ENV REPO http://dl.iuscommunity.org/pub/ius/stable/CentOS/\$releasever/\$basearch/
ENV PHP php56u-fpm php56u-gd php56u-mbstring php56u-mysql php56u-pdo php56u-xml
ENV PHPCONF /etc/php-fpm.d/www.conf

RUN echo -e "\
[ius]\n\
name=IUS Community Repository\n\
baseurl=$REPO\n\
enabled=1\n\
gpgcheck=0\n\
priority=1\n\
" >> /etc/yum.repos.d/ius.repo

RUN yum install -y $PHP ; yum clean all
RUN useradd -u 48 -U --home /var/www -M --shell /sbin/nologin apache
RUN sed -i '/^listen\ =\ 127.0.0.1/c\listen = 9000' $PHPCONF
RUN sed -i '/^listen.allowed_clients/c\; listen.allowed_clients = ' $PHPCONF
ADD run-phpfpm.sh /run-phpfpm.sh

EXPOSE 9000

ENTRYPOINT [ "/run-phpfpm.sh" ]
