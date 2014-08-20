#!/bin/bash

##########
#
# Update
#
##########

## Update ruby gem
gem update --system;

##########
#
# Update system packages
#
##########

sudo apt-get upgrade -y;
apt-get update -y;
