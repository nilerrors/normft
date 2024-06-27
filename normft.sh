#!/usr/bin/env bash

if command -v tput &>/dev/null && tty -s; then
  RED=$(tput setaf 1)
  YELLOW=$(tput setaf 3)
  GREEN=$(tput setaf 2)
  NORMAL=$(tput sgr0)
  BOLD=$(tput bold)
else
  RED=$(echo -en "\e[31m")
  YELLOW=$(echo -en "\e[33m")
  GREEN=$(echo -en "\e[32m")
  NORMAL=$(echo -en "\e[00m")
  BOLD=$(echo -en "\e[01m")
fi

norminette_exe=`which norminette`
if [ norminette_exe == "" ]; then
	echo "norminette not found"
	exit 1
fi

norm=`$norminette_exe`
if [ $? -ne 0 ]; then
	printf "${RED}${BOLD}✖ FAIL${NORMAL}\n" >&2
	printf "$YELLOW"
	echo "$norm" | grep -v 'OK!$'
	printf "$NORMAL"
else
	printf "${GREEN}${BOLD}✔ OK${NORMAL}\n" >&2
fi
