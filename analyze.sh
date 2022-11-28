#!/usr/bin/env bash

(

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

git config pull.ff only
git pull

: ${PREFIX:=/hao/apps/storj/h1storj*}

for d in ${PREFIX}; do
	echo "DIR = $d"
	rsync -a $d/storage/storage/{*.db,*.db-*} copied_db/
	./earnings.py copied_db/ "$@"
	rm -r copied_db/
done

)

