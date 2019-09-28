#!/bin/sh
set -e

echo 'Start'

for file in /polipo/conf/*
do
	if test -f $file
	then
		echo $file
		/usr/local/bin/polipo -c $file
	fi
done

exec echo 'All done'

echo 'Existing'
