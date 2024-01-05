#!/usr/bin/env bash

set -euf -o pipefail

LANG=${LANG:-en_US.UTF-8}
LC_ALL=${LC_ALL:-en_US.UTF-8}
export DEBIAN_FRONTEND=noninteractive

apt-get update

apt-get -y install --no-install-recommends \
	ca-certificates \
	curl \
	gnupg \
	python3-pip \
	software-properties-common

gpg \
	--homedir "${HOME}" \
	--no-default-keyring \
	--keyring /usr/share/keyrings/python.gpg \
	--keyserver hkp://keyserver.ubuntu.com:80 \
	--recv-keys F23C5A6CF475977595C89F51BA6932366A755776
chmod a+r /usr/share/keyrings/python.gpg

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/python.gpg] https://ppa.launchpadcontent.net/deadsnakes/ppa/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") main" |
	tee /etc/apt/sources.list.d/python.list >/dev/null

apt-get update
apt-get -y install --no-install-recommends \
	python3.10 \
	python3.10-dev \
	python3.10-distutils

python3.10 -m pip install -r /scripts/requirements.txt
python3.10 -m pip cache purge

rm -rf /var/lib/apt/lists/*
