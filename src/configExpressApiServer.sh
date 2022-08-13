#!/bin/bash

# Update with optional user data that will run on instance start.
# Learn more about user-data: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html

yum update -y

# https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html
# START
echo "Setting up NodeJS Environment"
curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
echo 'export NVM_DIR="/home/ec2-user/.nvm"' >> /home/ec2-usr/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> /home/ec2-user/.bashrc

# Dot source the files to ensure that variables are available within the current shell
. /home/ec2-user/.nvm/nvm.sh
. /home/ec2-user/.bashrc

# Install NVM, NPM, Node.JS
nvm install --lts
node -e "console.log('Running Node.js ' + process.version)"

echo "Setting up Git"
yum install git -y

echo "Setting up Process Manager"
npm install -g pm2

echo "Setting up Application"

git clone https://github.com/craigMull/simple-express-api-server.git
cd simple-express-api-server
npm i
# node server.js
pm2 start server.js

echo "Run to completion"

# Another Node Source to pull App from S3: https://repost.aws/questions/QUsgTfCKswT16EboaTH_oZJQ


