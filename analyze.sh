#!/usr/bin/env bash

(

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )"

git config pull.ff only
git pull

if [ -z "${DIR}" ]; then 
    DIR="/hao/apps/storj/h1storj*"
fi

for d in ${DIR}; do
	subdir="$d/storage/storage/"
	if ! [[ -d "$SUBDIR" ]]; then
		subdir="$d"
	fi
	echo "DIR = $subdir"
	rsync -a $subdir/{*.db,*.db-*} copied_db/
	./earnings.py copied_db/ "$@"
	rm -r copied_db/
done

)

