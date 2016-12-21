#!/usr/bin/env bash
set -e

ENV_FILE="${MAGE2_ROOT_DIR}/app/etc/env.php"
CONFIG_FILE="${MAGE2_ROOT_DIR}/app/etc/config.php"
SHARED_ENV_FILE="/var/www/env.php"

if [[ -f ${ENV_FILE} ]] && ! [[ -L ${ENV_FILE} ]] && ! [[ -f ${SHARED_ENV_FILE} ]]; then
    echo "preserve env.php configuration ..."
    cp -f ${ENV_FILE} ${SHARED_ENV_FILE}
fi

echo "clean up old installation ..."
find ${MAGE2_ROOT_DIR} -type f -exec rm {} \;
find ${MAGE2_ROOT_DIR} -type d -exec rm -R {} \;

composer create-project \
    --repository=https://repo.magento.com \
    --working-dir=/var/www \
    ${MAGE2_PACKAGE} \
    ${MAGE2_ROOT_DIR} \
    ${MAGE2_VERSION} \

chmod +x ${MAGE2_ROOT_DIR}/bin/magento

MODULE_NAMESPACE_DIR="${MAGE2_ROOT_DIR}/app/code/${MODULE_NAMESPACE}"

mkdir -p ${MODULE_NAMESPACE_DIR}
ln -s /var/www/module ${MODULE_NAMESPACE_DIR}/${MODULE_NAME}

if [[ -f ${SHARED_ENV_FILE} ]]; then
    ln -s ${SHARED_ENV_FILE} ${ENV_FILE}
fi

if ! [[ -f ${CONFIG_FILE} ]]; then
    ${MAGE2_ROOT_DIR}/bin/magento module:enable --all
    ${MAGE2_ROOT_DIR}/bin/magento setup:upgrade
fi
