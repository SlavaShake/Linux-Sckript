http://tecadmin.net/install-oracle-virtualbox-on-centos-redhat-and-fedora/#


nano /etc/yum.repos.d/virtualbox.repo


[virtualbox]
name=Oracle Linux / RHEL / CentOS-$releasever / $basearch - VirtualBox
baseurl=http://download.virtualbox.org/virtualbox/rpm/el/$releasever/$basearch
enabled=1
gpgcheck=1
gpgkey=http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc



CentOS/RHEL 7, 64 Bit (x86_64): 
# rpm -Uvh http://ftp.jaist.ac.jp/pub/Linux/Fedora/epel/7/x86_64/e/epel-release-7-5.noarch.rpm

CentOS/RHEL 6, 32 Bit (i386): 
# rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm 

CentOS/RHEL 6, 64 Bit (x86_64): 
# rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm 

CentOS/RHEL 5, 32 Bit (i386): 
# rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/i386/epel-release-5-4.noarch.rpm 

CentOS/RHEL 5, 64 Bit (x86_64): 
# rpm -Uvh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm



# yum install gcc make patch  dkms qt libgomp 
# yum install kernel-headers kernel-devel fontforge binutils glibc-headers glibc-devel

# export KERN_DIR=/usr/src/kernels/2.6.32-504.3.3.el6.x86_64

# yum install VirtualBox-5.0

# service vboxdrv setup
# virtualbox &

sudo yum update
yum --enablerepo rpmforge install dkms
sudo yum install -y binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-PAE-devel dkms
sudo yum groupinstall -y "Development Tools"
rpm -Uvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
