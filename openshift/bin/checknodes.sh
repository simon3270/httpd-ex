#!/bin/bash

# Check the nodes in a cluster are alive

# default OSR3
cluster=${1:-osr3}

if [[ $cluster =~ [0-9] ]]; then
  cluster=osr${cluster}
fi

if [[ $cluster =~ ^osp ]]; then
  dom=dbag.prod
else
  dom=xeop.de
fi

chkaddr() {
  nslookup $1  >/dev/null 2>&1
}

chkalive() {
  ping -c 1 -W 4 $1  >/dev/null 2>&1
}

chkssh() {
  timeout 10 ssh -o "StrictHostKeyChecking no" root@$1 date > /dev/null 2>&1
}

chkhost() {
  if ! chkaddr $1; then
    echo $1 not valid name
  elif ! chkalive $1; then
    echo $1 DEAD
  elif ! chkssh $1; then
    echo $1 pingable but no ssh
  else
    echo $1 alive
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

