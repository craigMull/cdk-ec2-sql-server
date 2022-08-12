#!/bin/bash -xe
# If your given node application has a different start command, replace the line in the script...

sudo yum update -y
echo "Setting up NodeJS Environment"

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
. ~/.nvm/nvm.sh
nvm install --lts

node -e "console.log('Running Node.js ' + process.version)"


sudo yum install git -y

# rest of the userdata.sh script above....
# Start the server
node . > stdout.log 2> stderr.log

# with...

# rest of the userdata.sh script above....
# Start the server
#yourcommand > stdout.log 2> stderr.log

### FULL EXAMPLE BELOW
### IF YOU USE THE BELOW, DO NOT INCLUDE ANYTHING FROM LINE 12 and ABOVE!!
#!/usr/bin/env bash

# Make a directory to clone the application code to
mkdir -p /home/ec2-user/app && cd /home/ec2-user/app
git clone https://github.com/jcolemorrison/ec2-lb-api.git .

# Install Dependencies
npm install

# Redirect Port 3000 to Port 80 Traffic
sudo iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-ports 3000

# Start the server
npm start > stdout.log 2> stderr.log