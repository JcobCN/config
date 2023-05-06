#! /bin/sh

# 启动对应服务
#service ssh ${1}
#service docker ${1}

# 设置本地Wsl2域名，默认为wsl2host
ipaddr=$(ip -4 addr show dev eth0 | egrep 'inet ([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3})' | awk '{print $2}' | awk -F/ '{print $1}')
hostName='wsl.local'
sed -i "/${hostName}/d" /mnt/c/Windows/System32/drivers/etc/hosts
echo "\r${ipaddr} ${hostName}" >> /mnt/c/Windows/System32/drivers/etc/hosts

sed -i "/${hostName}/d" /etc/hosts
echo "${ipaddr} ${hostName}" >> /etc/hosts

winip=$(cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }')
winhost='win.local'

sed -i "/${winhost}/d" /etc/hosts
echo "${winip} ${winhost}" >> /etc/hosts
