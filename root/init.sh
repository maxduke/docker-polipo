#!/bin/sh
set -e

for file in /polipo/conf/*
do
	if test -f $file
	then
		/usr/local/bin/polipo -c $file
	fi
done
