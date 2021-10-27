#!/bin/bash
# this file MUST be executable when comitting to git
#    chmod +x .platform/hooks/prebuild/01_prevent_npm_install.sh
#    git update-index --chmod=+x .platform/hooks/prebuild/01_prevent_npm_install.sh
#    git commit -m "commit_message"

# prebuild
#

set -euxo pipefail

echo '#~#~#~#~#~#~#~#~#~# START prebuild/01_prevent_npm_install.sh'


# need to install node first to be able to install yarn (as at prebuild no node is present yet)
#sudo curl --silent --location https://rpm.nodesource.com/setup_12.x | sudo bash -
#sudo yum -y install nodejs

# install yarn
#sudo wget https://dl.yarnpkg.com/rpm/yarn.repo -O /etc/yum.repos.d/yarn.repo
#sudo yum -y install yarn

# install
cd /var/app/staging/

# create so npm install does not run
mkdir node_modules/

chown -R webapp:webapp node_modules/ || true # allow to fail

echo '#~#~#~#~#~#~#~#~#~ FINISH prebuild/01_prevent_npm_install.sh'
