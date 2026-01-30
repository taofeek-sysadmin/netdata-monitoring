#!/usr/bin/env bash
systemctl stop netdata
dnf -y remove netdata
rm -rf /etc/netdata
