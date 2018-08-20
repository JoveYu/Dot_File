#!/usr/bin/env bash
#
# shell script for update dnspod ddns
#

DOMAIN=""
SUB_DOMAIN=""
DOMAIN_ID=""
RECORD_ID=""
TOKEN=""
FILE="last_ip"

# domain_id: 
# curl -k https://dnsapi.cn/Domain.List -d "login_token=$TOKEN" 
# record_id:
# curl -k https://dnsapi.cn/Record.List -d "login_token=$TOKEN&domain_id=$DOMAIN_ID"

function log()
{
    echo -n `date +'[%Y-%m-%d %H:%M:%S]'`
    echo " $1"
}

CURR_IP=`curl -s http://members.3322.org/dyndns/getip`
LAST_IP=`cat $FILE`
log "curr:$CURR_IP last:$LAST_IP"
BODY="format=json&login_token=${TOKEN}&domain_id=${DOMAIN_ID}&"
BODY+="record_id=${RECORD_ID}&sub_domain=${SUB_DOMAIN}&"
BODY+="value=${CURR_IP}&record_line=默认&record_type=A&ttl=600"


if [ "$CURR_IP" != "$LAST_IP" ]
then
    echo "$CURR_IP" > $FILE
    result=`curl -s POST https://dnsapi.cn/Record.Modify -d $BODY`
    log "$result"
fi
exit 0

