#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR

test -d .decrypted || mkdir .decrypted
for x in *
do
    test -f $x && (
        echo $1 | gpg --decrypt --batch --yes --passphrase-fd 0 --output .decrypted/$x $x
    )
done

chmod +x .decrypted/*.sh

