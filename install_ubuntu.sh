#!/bin/bash

sudo apt-get update

sudo apt-get install gdebi vlc pdfmod ttf-mscorefonts-installer synaptic libdvdcss2 cmake ubuntu-restricted-extras dconf-tools unity-tweak-tool p7zip-rar p7zip-full unace unrar zip unzip sharutils rar uudeview mpack arj cabextract file-roller ubuntu-restricted-extras libavcodec-extra

sudo add-apt-repository ppa:ubuntu-wine/ppa
sudo apt-get update
sudo apt-get install wine1.8
sudo apt-get install winetricks

cd /tmp/
sudo dpkg --add-architecture i386
sudo apt-add-repository 'https://dl.winehq.org/wine-builds/ubuntu/'
wget https://dl.winehq.org/wine-builds/Release.key && sudo apt-key add Release.key
sudo apt update && sudo apt install winehq-stable

sudo add-apt-repository ppa:linrunner/tlp
sudo apt update
sudo apt install tlp tlp-rdw
sudo tlp start

sudo add-apt-repository ppa:atareao/telegram
sudo apt-get update
sudo apt-get install telegram

sudo add-apt-repository ppa:webupd8team/y-ppa-manager
sudo apt-get update
sudo apt-get install y-ppa-manager

sudo add-apt-repository ppa:nemh/systemback
sudo apt-get update
sudo apt-get install systemback

sudo apt-add-repository ppa:hanipouspilot/file-roller
sudo apt-get update
sudo apt-get install file-roller

sudo add-apt-repository ppa:indicator-brightness/ppa
sudo apt-get update
sudo apt-get install indicator-brightness

