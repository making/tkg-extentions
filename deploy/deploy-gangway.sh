#!/bin/bash
set -e
BASEDIR=$(cd $(dirname $0)/..;pwd)
set -x

kapp deploy -a dex -c -f <(ytt --ignore-unknown-comments \
    -f ${BASEDIR}/config/authentication/gangway/vsphere \
    -f ${BASEDIR}/ytt/values.yaml) \
    $@