#!/bin/sh
#Install visual studio code
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
yum check-update
yum install code -y

#Set some basic git config
#Make sure to update the placeholders!
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL"

#Install nano because my fingers are too clumsy for vi(m)
yum install nano -y

#Install node/npm (v16) and angular
curl -sL https://rpm.nodesource.com/setup_16.x | bash -
yum install -y nodejs
npm install -g @angular/cli

#Install chromium
amazon-linux-extras install epel -y
yum install chromium -y

#Install google chrome
rpm --import https://dl-ssl.google.com/linux/linux_signing_key.pub
sh -c 'echo -e "[google64]\nname=Google - x86_64\nbaseurl=http://dl.google.com/linux/rpm/stable/x86_64\nenabled=1\ngpgcheck=1\ngpgkey=https://dl-ssl.google.com/linux/linux_signing_key.pub" > /etc/yum.repos.d/google-chrome.repo'
yum install google-chrome-stable -y