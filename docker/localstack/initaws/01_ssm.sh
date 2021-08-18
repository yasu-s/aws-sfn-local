#!/bin/bash

while read row; do
  key=`echo ${row} | cut -d = -f 1`
  value=`echo ${row} | cut -d = -f 2`
  echo "${key}=${value}"
  awslocal ssm put-parameter --name "${key}" --value "${value}" --overwrite
done < /docker-entrypoint-initaws.d/.env.local
