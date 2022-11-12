#!/usr/bin/env bash

for d in /hao/apps/storj/h1storj*; do
	echo "DIR = $d"
	rsync -a $d/storage/storage/{*.db,*.db-*} copied_db/
	./earnings.py copied_db/
	rm -r copied_db/
done
