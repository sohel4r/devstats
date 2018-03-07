#!/bin/sh
if [ -z "${FROM}" ]
then
  echo "You need to set FROM, example FROM=abc FILES='f1 f2' $0"
  exit 1
fi
if [ -z "${FILES}" ]
then
  echo "You need to set FILES, example FROM=abc FILES='f1 f2' $0"
  exit 3
fi
host=`hostname`
if [ $host = "cncftest.io" ]
then
  all="kubernetes prometheus opentracing fluentd linkerd grpc coredns containerd rkt cni envoy jaeger notary tuf rook vitess opencontainers all cncf"
else
  all="kubernetes prometheus opentracing fluentd linkerd grpc coredns containerd rkt cni envoy jaeger notary tuf rook vitess opencontainers all"
fi
FROM="    \"$FROM\""
for proj in $all
do
  echo "Project: $proj"
  TO="    \"$proj\""
  for f in ${FILES}
  do
    f="./grafana/dashboards/$proj/$f"
    echo "FROM=$FROM TO=$TO f=$f"
    ./replacer $f || exit 1
  done
done
echo 'OK'