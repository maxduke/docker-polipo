#!/bin/sh
set -e

echo 'Start'

rm /var/run/polipo*.pid

for file in /polipo/conf/*
do
	if test -f $file
	then
		echo $file
		/usr/local/bin/polipo -c $file
	fi
done

echo 'All done'

exec tail -f /dev/null

echo 'Existing'
