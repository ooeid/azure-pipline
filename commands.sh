#!/usr/bin/env bash
# this script contain all Azure CLI commands you used

git clone https://github.com/ooeid/azur-pipline2.git
cd azur-pipline2
git pull
make all
az webapp up -n flask-ml-app-one
az webapp log tail -n