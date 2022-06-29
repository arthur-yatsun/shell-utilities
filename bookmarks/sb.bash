#!/usr/bin/zsh

file=~/.config/aliases.bash

touch $file || true


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


case "$1" in
    -c | --create)
        name=$2
        if [ -n "$name" ]; then
            echo "alias $name=\"cd $(pwd)\"" >> $file
            echo "Created"
            source $file && (zsh || bash)
        else
            echo 'Please provide bookmark name'
        fi
        ;;
    -r | --remove)
        sed -i "\~$(pwd)~d" $file
        source $file && (zsh || bash)
        ;;
    -l | --list)
        cat $file
        ;;
    *)
        usage
        exit
        ;;
esac

