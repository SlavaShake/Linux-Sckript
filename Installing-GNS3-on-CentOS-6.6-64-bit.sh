#!/bin/bash
#--- GNS3 is installed from a Terminal command line ---
#! - I recommend starting the install from your user directory.
##$ cd ~
#! -- Add your account to the 'sudoers' file, so that you can elevate you're #user account to superuser as needed.
#$ su -
# nano /etc/sudoers
#
#   Add:  jneumann ALL=(ALL) ALL        <--- replace "jneumann" with your user #name
#[save and close the file]
#
# exit
# Upgrade all the packages on your CentOS System

sudo yum update
sudo yum groupinstall -y 'development tools'
sudo yum install -y zlib-devel
sudo yum install -y openssl-devel
sudo yum install -y sqlite-devel
sudo yum install -y bzip2-devel
sudo yum install -y telnet

# Install Python-3.3.3

cd ~/Downloads
mkdir gns3
cd gns3
wget http://www.python.org/ftp/python/3.3.3/Python-3.3.3.tar.xz
xz -d Python-3.3.3.tar.xz
tar xvf Python-3.3.3.tar
cd Python-3.3.3
./configure --prefix=/usr/local
make
sudo make altinstall
cd /usr/bin
sudo ln -s /usr/local/bin/python3.3 python3

#Install Python setuptools

cd ~/Downloads/gns3
wget https://pypi.python.org/packages/source/s/setuptools/setuptools-12.2.zip
unzip setuptools-12.2.zip
cd setuptools-12.2
sudo python3 setup.py install
cd ..

#Install ws4py 

git clone https://github.com/Lawouach/WebSocket-for-Python
# in
cd WebSocket-for-Python 
# in
sudo python3 setup.py install
cd ..

#install Qt4
sudo yum install -y qt4-devel
cd /usr/bin
sudo ln -s qmake-qt4 qmake

#Install sip

cd ~/Downloads/gns3
wget http://sourceforge.net/projects/pyqt/files/sip/sip-4.16.5/sip-4.16.5.tar.gz
tar zxvf sip-4.16.5.tar.gz
cd sip-4.16.5
python3 ./configure.py
make
sudo make install
cd ..

#Install pyqt4 (be patient - this takes a while to build)

wget http://sourceforge.net/projects/pyqt/files/PyQt4/PyQt-4.11.3/PyQt-x11-gpl-4.11.3.tar.gz
tar zxvf PyQt-x11-gpl-4.11.3.tar.gz
cd PyQt-x11-gpl-4.11.3
python3 ./configure.py -g  
#
#    type: "yes" to accept the license
make
sudo make install
cd ..


#Install netifaces 

wget https://pypi.python.org/packages/source/n/netifaces/netifaces-0.10.4.tar.gz
unzip netifaces-0.10.4.tar.gz
cd netifaces-0.10.4
sudo python3 setup.py install


#Install Dynamips dependencies

sudo yum install -y cmake
sudo yum install -y elfutils-libelf-devel
sudo yum install -y libpcap-devel
sudo yum install -y libuuid-devel

#Install IOU x86 dependencies.

rpm -aq | grep openssl

#        openssl-1.0.1e-30.el6.8.x86_64
#        Install the 32-bit (.i686) version of the
#	 openssl package listed in the output.
#
#             Remove .x86_64 from the filename and append with .i686 as shown below.

sudo yum install -y openssl-1.0.1e-30.el6.8.x86_64  

sudo ln -s /usr/lib/libcrypto.so.10 /usr/lib/libcrypto.so.4

sudo yum install -y libgcc_s.so.1

 

#Install other IOU dependencies

cd ~/Downloads/gns3

wget http://ndevilla.free.fr/iniparser/iniparser-3.1.tar.gz

tar zxf iniparser-3.1.tar.gz

cd iniparser

make

sudo cp libiniparser* /usr/lib

sudo cp src/*.h /usr/include



 

# Download and Unzip GNS3 Base files Download

#  unzip GNS3-1.3.3-source.zip

#     dynamips-0.2.14.zip  gns3-server-1.3.3.zip  vpcs-0.6.zip

#     gns3-gui-1.3.3.zip   iouyap-0.95.zip


cd ~/Downloads/gns3
mkdir gns
cd gns


#Install the gns3-server

 git clone https://github.com/GNS3/gns3-server.git


 cd gns3-server

 sudo python3 setup.py install

 cd ..

 

#Install the gns3-gui

 git clone https://github.com/GNS3/gns3-gui.git


 cd gns3-gui

 sudo python3 setup.py install

 cd ..

 

#Fix GNOME menu icons

 gconftool-2 --type Boolean --set /desktop/gnome/interface/menus_have_icons True

 

#Install Dynamips

 git clone https://github.com/GNS3/dynamips.git


 cd dynamips

 mkdir build

 cd build

 cmake ..

 make

 sudo make install 

 sudo setcap cap_net_admin,cap_net_raw=ep /usr/local/bin/dynamips

 cd ..
cd ..

 

#Install IOU network support

 git clone https://github.com/GNS3/iouyap.git

 cd iouyap

 make

 sudo make install

 sudo cp iouyap /usr/local/bin/

 cd ..

 

#Install VPCS

 sudo yum install -y glibc-static

 git clone  https://github.com/GNS3/vpcs.git

 cd vpcs/src/

 ./mk.sh

 sudo cp vpcs /usr/local/bin/

 cd ../..

 

#Install cpulimit

 wget http://sourceforge.net/projects/cpulimit/files/cpulimit/cpulimit/cpulimit-1.1.tar.gz

 tar zxvf cpulimit-1.1.tar.gz

 cd cpulimit-1.1

 make

 sudo cp cpulimit /usr/local/bin

 cd ..

 

# Install QEMU (from source)

 sudo yum install -y flex

 sudo yum install -y bison

 sudo yum install -y zlib-devel

 sudo yum install -y glib2-devel

 cd ~/Downloads/gns3

 wget http://wiki.qemu-project.org/download/qemu-2.3.0.tar.bz2

 bunzip2 qemu-2.3.0.tar.bz2

 tar xvf qemu-2.3.0.tar   

 cd qemu-2.3.0

 #./configure

#Or for a x86 arch only install, configure this way, instead.
#
# ./configure --target-list="i386-softmmu x86_64-softmmu"
./configure --target-list="x86_64-softmmu"
  make

  sudo make install

 

# Install wireshark

sudo yum install -y wireshark-gnome
