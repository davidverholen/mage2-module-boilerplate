#!/usr/bin/env bash
set -e

${MAGE2_ROOT_DIR}/bin/magento setup:install \
    --base-url=${MAGE2_BASE_URL} \
    --backend-frontname=${MAGE2_BACKEND_FRONTNAME} \
    --db-host=${MAGE2_DB_HOST} \
    --db-name=${MAGE2_DB_NAME} \
    --db-user=${MAGE2_DB_USER} \
    --db-password=${MAGE2_DB_PASSWORD} \
    --admin-firstname=${MAGE2_ADMIN_FIRSTNAME} \
    --admin-lastname=${MAGE2_ADMIN_LASTNAME} \
    --admin-email=${MAGE2_ADMIN_EMAIL} \
    --admin-user=${MAGE2_ADMIN_USER} \
    --admin-password=${MAGE2_ADMIN_PASSWORD} \
    --language=${MAGE2_LANGUAGE} \
    --currency=${MAGE2_CURRENCY} \
    --timezone=${MAGE2_TIMEZONE} \
    --cleanup-database \
    --use-rewrites=1 \
 && ${MAGE2_ROOT_DIR}/bin/magento deploy:mode:set developer
