#!/bin/bash

# Get IP addressess of nodes in a cluster

# default OSR3
cluster=${1:-osr3}

if [[ $cluster =~ ^osp ]]; then
  dom=dbag.prod
lb_sep=""
else
  dom=xeop.de
lb_sep="-"
fi

chkaddr() {
  nslookup $1 | grep . | tail -1 >/dev/null 2>&1
  if [ $? -eq 0 ]; then
    echo ${1}: "$(nslookup $1 | grep . | tail -1)"
    true
  else
    false
  fi
}

chkalive() {
  ping -c 1 -W 4 $1  >/dev/null 2>&1
}

chkssh() {
  timeout 10 ssh -o "StrictHostKeyChecking no" root@$1 date > /dev/null 2>&1
}

chkhost() {
  if ! chkaddr $1; then
    echo ${1}: not valid name
  fi
}

for ii in 1 2 3; do
  hst=${cluster}master0${ii}.${dom}
  chkhost $hst
done

for ii in 1 2 3; do
  hst=${cluster}infra0${ii}.${dom}
  chkhost $hst
done

for ii in 1 2 3; do
  hst=${cluster}node0${ii}.${dom}
  chkhost $hst
done

for ii in 1 2 3 4; do
  hst=${cluster}glfs0${ii}.${dom}
  chkhost $hst
done

for hst in apps.${cluster}.${dom} ${cluster}${lb_sep}cluster.${dom} ${cluster}${lb_sep}cluster${lb_sep}internal.${dom}; do
  chkhost $hst
done
