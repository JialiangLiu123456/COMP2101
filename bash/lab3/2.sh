myhostname=$(hostname)
lanaddress=$(ip a s $(ip a |awk '/: e/{gsub(/:/,"");print $2}')|awk '/inet /{gsub(/\/.*/,"");print $2}')
lanhostname=$(getent hosts $lanaddress | awk '{print $2}')
interface_name=$(ip a |awk '/: e/{gsub(/:/,"");print $2}')
extipaddress=$(curl -s icanhazip.com)
extname=$(getent hosts $extipaddress | awk '{print $2}')
router_address=$(route -n | grep '^0.0.0.0' | awk '{print $2}')
router_hostname=$(getent hosts 127.0.0.1 | awk '{print $2}')
cat <<EOF
Hostname        : $myhostname
LAN Address     : $lanaddress
LAN Hostname    : $lanhostname
External IP     : $extipaddress
External Name   : $extname
Router Hostname : $router_hostname
Router Address  : $router_address
EOF
