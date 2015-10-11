cd /etc/yum.repos.d
wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo
sudo yum update
yum --enablerepo rpmforge install dkms
sudo yum install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-PAE-devel dkms
sudo yum groupinstall -y "Development Tools"
rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
