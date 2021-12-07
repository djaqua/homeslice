#!/bin/bash

sprinkles_location="${PWD}/sprinkles"

core_local=`cat<<EOF
SPRINKLES_LOCATION="$sprinkles_location"\n
EOF`


echo -e -n $core_local | cat > sprinkles/01-core.local

rc_common=`cat<<EOF
\n
\nif [ -d $sprinkles_location ]; then
\n\tsource <(cat $sprinkles_location/*)
\nelse 
\n\techo "FYI - the shell sprinkles location has changed -- update shell rc-files accordingly"
\nfi
EOF`


# Bash
bashrc=${HOME}/.bashrc
if [[ -f $bashrc && ! -f bashrc.stub ]]; then
    echo -e -n $rc_common | cat > bashrc.stub
    cat bashrc.stub >> $bashrc
fi

# ZSH
zshrc=${HOME}/.zshrc
if [[ -f $zshrc && ! -f zshrc.stub ]]; then
    echo -e -n $rc_common | cat > zshrc.stub
    cat zshrc.stub >> $zshrc
fi


