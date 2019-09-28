#!/bin/sh

echo 'Start'

for file in /polipo/conf/*
do
	if test -f $file
	then
		set -x
		/usr/local/bin/polipo -c $file
		set +x
	fi
done

echo 'All done'
