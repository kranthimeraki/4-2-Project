#!/bin/bash
curl -sL https://rpm.nodesource.com/setup_10.x | sudo -E bash -;
yum install nodejs --enablerepo=nodesource -y;
npm install npm -y;
mkdir wbsite-deploy;
cd wbsite-deploy;
npm init -y;
npm install express --save;
npm install mysql --save;
