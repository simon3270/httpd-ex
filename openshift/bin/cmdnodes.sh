#!/bin/bash

# Run a command on all of the nodes in a cluster (default osr4)

# default OSR4
cluster=4
if [[ $1 =~ [0-9] ]]; then
  cluster=${1}
  shift
fi

cmd="$*"

chkalive() {
  ping -c 1 -W 4 $1  >/dev/null 2>&1
}

chkssh() {
  ssh root@$1 -- $cmd < /dev/null
}

chkhost() {
  if chkalive $1; then
    echo $1 alive
    if chkssh $1; then
      : echo $1 alive
    else
      echo $1 pingable but no ssh
    fi
  else
    echo $1 DEAD
  fi
}

for ii in 1 2 3; do
  hst=osr${cluster}master0${ii}.xeop.de
  chkhost $hst
done

for ii in 1 2 3; do
  hst=osr${cluster}infra0${ii}.xeop.de
  chkhost $hst
done

for ii in 1 2 3; do
  hst=osr${cluster}node0${ii}.xeop.de
  chkhost $hst
done

for ii in 1 2 3 4; do
  hst=osr${cluster}glfs0${ii}.xeop.de
  chkhost $hst
done

