#!/bin/bash
# check SIP and H.323 DNS SRV records for a given domain name
# whaisch@use.startmail.com
# 2014-OCT-13 - old version only useful for me
# 2017-SEP-27 - made more useful for other users
# 2017-SEP-28 - added h323rs DNS record

# USER INPUTS:
# $1 = domain name to check (e.g. example.com)
# $2 = internal DNS server (optional, will use default DNS if not specified)
# $3 = external DNS server (optional, only active if internal DNS server is specified)

# DNS service names based on Cisco Tandberg H.323 and SIP documentation:
# https://www.cisco.com/c/dam/en/us/td/docs/voice_ip_comm/expressway/config_guide/X8-9/Cisco-Expressway-Cluster-Creation-and-Maintenance-Deployment-Guide-X8-9-2.pdf
# https://www.ietf.org/rfc/rfc3263.txt
# https://www.ietf.org/rfc/rfc2782.txt

if [[ -z ${1} && -z ${2} ]]; then
    echo "List internal and external DNS SRV records for H.323 and SIP."
    echo "Usage: $0 <example.com> <optional-internal-dns-server> <optional-external-dns-server>"
    echo "Please specify a domain name."
    exit 1
fi

domain=${1}
dns_internal=${2}
dns_external=${3}

service=( "_h323cs._tcp."
          "_h323ls._udp."
          "_h323rs._udp."
          "_sip._tcp."
          "_sip._udp."
          "_sips._tcp."
          "_sips._tls."
          "_sip._tls."
        )

echo -n "Checking DNS records "
index=0
while [ $index -lt ${#service[*]} ]; do
    #echo "debug: Checking internal service: ${service[${index}]}${domain}"
    echo -n "."
    internal[${index}]=`\host -t srv ${service[${index}]}${domain} ${dns_internal} 2>&1 | grep 'has SRV record'`
    #echo "debug: Checking external service: ${service[${index}]}${domain}"
    if [ ! -z ${dns_external} ]; then
        external[${index}]=`\host -t srv ${service[${index}]}${domain} ${dns_external} 2>&1 | grep 'has SRV record'`
        echo -n "."
    fi
    index=`expr $index + 1`
done
echo ' '

if [ -z ${dns_internal} ]; then
    echo "Records from default DNS server:"
else
    echo "Records from ${dns_internal}:"
fi
index=0
while [ $index -lt ${#service[*]} ]; do
    if [ -z "${internal[$index]}" ]; then
        echo "   ${service[${index}]}${domain} SRV record does not exist."
    else
        echo "   ${internal[${index}]}"
    fi
    index=`expr $index + 1`
done

if [ ! -z ${dns_external} ]; then
    echo "Records from ${dns_external}:"
    index=0
    while [ $index -lt ${#service[*]} ]; do
        if [ -z "${external[$index]}" ]; then
            echo "   ${service[${index}]}${domain} SRV record does not exist."
        else
            echo "   ${external[${index}]}"
        fi
        index=`expr $index + 1`
    done
fi

echo "Results as of `date`"

exit 0
