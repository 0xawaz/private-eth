#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

usage()
{
cat <<EOF

usage: $0 options

This script will deploy all manifests.

OPTIONS:
   -h      Show this message
   -m      Mode for deployment: apply|delete
EOF
}

MODE=
VERSION=

while getopts "hm:" OPTION
do
     case $OPTION in
         h)
            usage
            exit 1
            ;;
         m)
            MODE="$OPTARG"
            ;;
         ?)
            usage
            exit
            ;;
     esac
done

# check for arguments

if [[ -z $MODE ]]
then
     echo "You must provide a valid deployment mode in argument" >&2
     usage
     exit 1
fi

######################
# 1. Setup Environment
######################
# TODO

#####################
# 2. Start Deployment
#####################
ARGOCD_DIR="${SCRIPT_DIR}/../argocd"

if [[ ${MODE} == "apply" ]]
then
   kubectl create namespace argocd
   kubectl "${MODE}" -f "${ARGOCD_DIR}/install.yaml"
   sleep 10
   kubectl "${MODE}" -f "${ARGOCD_DIR}/project.yaml"
   kubectl "${MODE}" -f "${ARGOCD_DIR}/apps/system.yaml"
   kubectl "${MODE}" -f "${ARGOCD_DIR}/apps/web/"
   sleep 10
   kubectl "${MODE}" -f "${ARGOCD_DIR}/argocd-ingress.yaml"
   kubectl "${MODE}" -f "${ARGOCD_DIR}/apps/monitor/"
   sleep 10
   kubectl "${MODE}" -f "${ARGOCD_DIR}/apps/eth/"

elif [[ ${MODE} == "delete" ]]
then
   echo "Warning: This is a cleanup command. This command is disabled for now, we will make a better script to allow cleanup :)"
else
   echo "Unknown deployment mode ${MODE}"
   usage
   exit 1
fi