#!/usr/bin/env bash
set -e

envsubst '${MAGE2_ROOT_DIR}' < /magento2.conf.template > /etc/nginx/conf.d/magento2.conf

nginx -g "daemon off;"
