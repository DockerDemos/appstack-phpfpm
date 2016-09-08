#!/bin/bash

set -e

set_domain() {
  local server="${1}"

  if [[ -z ${DOMAIN} ]]
  then
    local domain="$(echo ${server} | awk -F. '{print $(NF-1)"."$NF}')"
  else
    local domain="${DOMAIN}"
  fi

  echo $domain
  return 0
}

config_ssmtp () {
  local mail_config='/etc/ssmtp/ssmtp.conf'
  local server="${SMTPSERVER}"
  local domain="$(set_domain ${server})"

  /bin/cat <<- EOF > ${mail_config}
root=postmaster
mailhub=${server}:465
ReweriteDomain=${domain}
FromLineOverride=YES
UseTLS=YES
TLS_CA_FILE=/etc/pki/tls/certs/ca-bundle.crt
EOF

  return 0
}

config_php () {
  local php_ini='/etc/php.ini'
  local sendmail='^sendmail_path = '
  local ssmtpmail='sendmail_path = \/usr\/sbin\/ssmtp -t'

  /bin/sed -i "/${sendmail}/c\\${ssmtpmail}" ${php_ini}

  return 0
}

main () {
  # Setup mail, if container started with "-e SMTPSERVER"
  if [[ ! -z "${SMTPSERVER}" ]]
  then
    config_ssmtp
    config_php
  fi
}

main "$@"
