#!/usr/bin/env bash
set -e

echo "🔍 Detecting OS..."

if command -v dnf >/dev/null 2>&1; then
  echo "📦 CentOS/RHEL detected — using dnf"
  sudo dnf install -y curl
elif command -v apt >/dev/null 2>&1; then
  echo "📦 Ubuntu/Debian detected — using apt"
  sudo apt update
  sudo apt install -y curl
else
  echo "❌ Unsupported OS"
  exit 1
fi

echo "⬇️ Installing Netdata..."
curl https://get.netdata.cloud/kickstart.sh > /tmp/netdata-kickstart.sh
sudo sh /tmp/netdata-kickstart.sh --dont-wait
