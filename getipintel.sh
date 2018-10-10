#!/bin/bash
#########################################################
# query getipintel data to detect proxy, vpn or bad ips
# https://getipintel.net/
# written by George Liu (eva2000) https://centminmod.com
#########################################################
# variables
#############
DT=$(date +"%d%m%y-%H%M%S")
VER=0.1
#########################################################
# functions
#############

ipcheck() {
  email=$1
  ip=$2
  mode=$3
  flag=$4

  if [[ "$flag" = 'proxyvpn' ]]; then
    flagopt='&flags=b'
  elif [[ "$flag" = 'proxyvpn-badipcheck' ]]; then
    flagopt=""
  fi

  if [[ "$mode" = 'quick' ]]; then
    curl -s "http://check.getipintel.net/check.php?ip=$ip&contact=$email&format=json${flagopt}" | jq -r '.result'
  else
    curl -s "http://check.getipintel.net/check.php?ip=$ip&contact=$email&format=json${flagopt}" | jq
  fi
}

#########################################################
case $1 in
  check )
    email=$2
    ip=$3
    ipcheck $email $ip
    ;;
  proxyvpn-check )
    email=$2
    ip=$3
    ipcheck $email $ip quick proxyvpn
    ;;
  proxyvpn-badipcheck )
    email=$2
    ip=$3
    ipcheck $email $ip quick badipcheck
    ;;
  pattern )
    ;;
  pattern )
    ;;
  * )
    echo
    echo "$0 check email@yourdomain.com ipaddress"
    echo "$0 proxyvpn-check email@yourdomain.com ipaddress"
    echo "$0 proxyvpn-badipcheck email@yourdomain.com ipaddress"
    ;;
esac
exit
