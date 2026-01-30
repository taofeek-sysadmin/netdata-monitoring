#!/usr/bin/env bash
set -e

dnf -y update
dnf -y install curl

curl https://get.netdata.cloud/kickstart.sh | bash

# Firewall may not exist in CI
if command -v firewall-cmd >/dev/null 2>&1; then
  firewall-cmd --add-port=19999/tcp --permanent
  firewall-cmd --reload
fi
