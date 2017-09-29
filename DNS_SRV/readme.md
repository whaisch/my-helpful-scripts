#### Readme for `check_SIP_H323_DNS_SRV_records.sh`

Written by __William Haisch (*<whaisch@use.startmail.com>*)__

##### What does this script do?

This script will query DNS servers and display __SIP and H.323__ DNS SRV records (i.e. the DNS Service records). Doing this manually with the `host` command is difficult and prone to error. Now with one command, you can poll DNS servers for all of the __SIP and H.323__ settings contained within. The script is written in `Bash` and utilizes the `host` command for the heavy lifting with `grep` providing text filtering for a more concise output. It has been tested and verified working on __Mac OS X (with MacPorts)__ and __Kali Linux__. Therefore, it should work on similar platforms.

##### How to use this script:

I originally designed this script to query an internal and external DNS server to verify the DNS SRV records were returning the expected values. Running the script without any options will give a brief description of its inputs. Providing a domain name without any other operands will query the default DNS server for the records. When providing a domain name and __*a single DNS server*__, the script will query the records from the specified DNS server. When providing a domain name and __*two DNS servers*__, the script will query each server for the requested settings *(usually an internal DNS server and an external DNS server)*. Hopefully you will find this as helpful as I did. Enjoy!

##### My DNS Haiku

_Domain Name System_ \
_Programs tease the data out_ \
_Names and numbers flow_

