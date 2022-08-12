#!/bin/bash -xe

# Update with optional user data that will run on instance start.
# Learn more about user-data: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html

yum update -y
yum install httpd -y
service httpd start
chkconfig httpd on


yum install mysql -y

# https://docs.aws.amazon.com/sdk-for-javascript/v2/developer-guide/setting-up-node-on-ec2-instance.html
# START
echo "Setting up NodeJS Environment"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install --lts

node -e "console.log('Running Node.js ' + process.version)"


sudo yum install git -y

# Node socket Demo
git clone https://github.com/justincervantes/socketio-server-demo.git
cd socketio-server-demo
npm i
node index.ts


npm install express --save

# Another Node Source to pull App from S3: https://repost.aws/questions/QUsgTfCKswT16EboaTH_oZJQ


