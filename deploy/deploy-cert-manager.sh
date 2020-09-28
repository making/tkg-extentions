#!/bin/bash
set -e
BASEDIR=$(cd $(dirname $0)/..;pwd)
set -x

kapp deploy -a cert-manager -c -f <(ytt --ignore-unknown-comments \
    -f ${BASEDIR}/config/cert-manager) \
    $@