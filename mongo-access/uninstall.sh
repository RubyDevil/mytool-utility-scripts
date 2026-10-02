#!/bin/bash
# Run by mytool as root before removing or updating mongo-access: uninstall.sh <installed script path>

set -euo pipefail

rm -f -- "${MYTOOL_SUDOERS_DIR:-/etc/sudoers.d}/mytool-mongo-access"
