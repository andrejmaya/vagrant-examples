yum update -y
yum install -y telnet net-tools tcpdump iptables-services
systemctl enable iptables.service

#install ansible
sudo yum install -y epel-release
sudo yum install -y ansible

#curl -fsSL https://get.docker.com/ | sh
#usermod -aG docker vagrant