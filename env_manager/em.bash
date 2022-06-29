#!/usr/bin/zsh

source_dir=~/.config/env_variables
entry="$source_dir/main.bash"

mkdir -p $source_dir
touch $entry || true



usage()
{
cat << EOF
usage: $0 [ -c NAME | -r ]

Creates a bookmarks for directories.

OPTIONS:
   -c NAME      Create a bookmark called NAME for the current dir
   -r           Remove bookmark for the current dir
   -l           List all bookmarks
EOF
}


variable_name=$2

case "$1" in
    get)

        # check if variable is empty
        if [[ -z "$variable_name" ]]; then
            echo "Please provide variable name"
        else
            # change case to upper
            variable_name="${${variable_name}:u}"
            print -rl -- ${(P)variable_name}
        fi

        ;;
    set)
        sed -i "\~$(pwd)~d" $file
        source $file && (zsh || bash)
        ;;
    rm)
        cat $file
        ;;
    cat)
        echo "cat"
        ;;
esac
