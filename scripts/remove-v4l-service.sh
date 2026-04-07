#!/bin/bash
set -e

SERVICE_NAME="psee-v4l-setup.service"

echo "Removing V4L setup service..."

sudo systemctl stop $SERVICE_NAME 2>/dev/null || true
sudo systemctl disable $SERVICE_NAME 2>/dev/null || true
sudo rm -f /etc/systemd/system/$SERVICE_NAME
sudo rm -f /usr/local/bin/rp5_setup_v4l.sh
sudo systemctl daemon-reload

echo "Service removed."
