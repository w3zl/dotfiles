#!/usr/bin/env bash
file=$1

case "$file" in
    *.png |*.jpg |*.jpeg)
        clear
        kitten icat --stdin no --transfer-mode memory "$file" < /dev/null > /dev/tty
    ;;
esac
