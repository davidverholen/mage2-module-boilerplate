#!/usr/bin/env bash
set -e

${MAGE2_ROOT_DIR}/bin/magento sampledata:deploy
${MAGE2_ROOT_DIR}/bin/magento setup:upgrade
