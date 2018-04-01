yum update -y
yum install -y telnet net-tools tcpdump iptables-services
systemctl enable iptables.service
curl -fsSL https://get.docker.com/ | sh
usermod -aG docker vagrant