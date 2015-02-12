#!/bin/bash

LOGDIR='/var/log/php-fpm'
THREADYAML='/conf/threads.yaml'
HOSTCONF='/etc/php-fpm.d/www.conf'

f_set_threads () {
  if [[ $1 == '--default' ]] ; then
    MAX_CHILD='20'
    MIN_SPARE='5'
    MAX_SPARE='10'
    MAX_REQUESTS='500'
  else
    MAX_CHILD="$(awk '/fpm_fpm_maxchild/ {print $2}' $THREADYML)"
    MIN_SPARE="$(awk '/fpm_fpm_maxchild/ {print $2}' $THREADYML)"
    MAX_SPARE="$(awk '/fpm_fpm_maxchild/ {print $2}' $THREADYML)"
    MAX_REQUESTS="$(awk '/fpm_fpm_maxchild/ {print $2}' $THREADYML)"
  fi
  sed -i "s/.*pm.max_children\ =\ .*/pm.max_children = $MAX_CHILD/" $HOSTCONF
  sed -i "s/.*pm.min_spare_servers\ =\ .*/pm.min_spare_servers = $MIN_SPARE/" $HOSTCONF
  sed -i "s/.*pm.max_spare_servers\ =\ .*/pm.max_spare_servers = $MAX_SPARE/" $HOSTCONF
  sed -i "s/.*pm.max_requests\ =\ .*/pm.max_requests = $MAX_REQUESTS/" $HOSTCONF
}

# Make the log dirs (in case we mount volumes from elsewhere)
if [[ ! -d $LOGDIR ]] ; then
  mkdir -p $LOGDIR
fi
if [[ ! -f $LOGDIR/error.log ]] ; then
  touch $LOGDIR/error.log
fi

chown -R apache.root $LOGDIR

# Setup the thread count
if [[ -f $THREADYAML ]] ; then
  f_set_threads
else
  f_set_threads --default
fi

# Run the SSMTP setup script
/bin/bash /config-ssmtp.sh

exec /usr/sbin/php-fpm -F
