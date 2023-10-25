#!/bin/bash
# Install consul to Debian distros
# Created by Yevgeniy Goncharov, http://sys-adm.in

# Sys env / paths / etc
# -------------------------------------------------------------------------------------------\
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"

# Vars
HOSTNAME=`hostname`
SERVER_IP=`hostname -I`

# Functions
# create_systemd_unit() {

# }

# create_consul_config() {

# }

# Installation
# -------------------------------------------------------------------------------------------\

# Install packages
apt update && apt -y install gnupg2 curl lsb-release

# Install consul's gpg key
curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -

# Add hashicorp's repository to sources.list
echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" > /etc/apt/sources.list.d/hashicorp.list

# Update and install consul
apt update
apt -y install consul

# Final Checking
# -------------------------------------------------------------------------------------------\
# Check Consul installation version
consul -v
