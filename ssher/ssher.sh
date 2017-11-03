#!/usr/bin/env bash

echo "SSH LOG" >> sshlog
nl sshlist
echo "index? "
read index
KEY="ssh `head -n$index sshlist | tail -n1`"
echo "$KEY `date`" >> sshlog
$KEY