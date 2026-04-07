#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_DIR="$(dirname "$SCRIPT_DIR")"
SERVICE_NAME="psee-v4l-setup.service"

echo "Installing V4L setup service..."

# Install the setup script
sudo install -m 0755 "$REPO_DIR/rp5_setup_v4l.sh" /usr/local/bin/rp5_setup_v4l.sh

# Install the systemd service
sudo install -m 0644 "$SCRIPT_DIR/$SERVICE_NAME" /etc/systemd/system/$SERVICE_NAME

sudo systemctl daemon-reload
sudo systemctl enable $SERVICE_NAME

echo "Service installed and enabled. It will run at every boot."
echo "To run it now:  sudo systemctl start $SERVICE_NAME"
echo "To check status: systemctl status $SERVICE_NAME"
