#!/bin/bash

find /docker-entrypoint-initaws.d -name ".env.*" -type f -exec basename {} \; | while read -r fname
do
  rootKey=`echo ${fname} | cut -d . -f 3`
  echo ${fname} - ${rootKey}
  while read row; do
    key=`echo ${row} | cut -d = -f 1`
    value=`echo ${row} | cut -d = -f 2`
    echo "- /${rootKey}/${key}=${value}"
    awslocal ssm put-parameter --name "/${rootKey}/${key}" --value "${value}" --overwrite
  done < /docker-entrypoint-initaws.d/$fname
done
