#! /bin/bash

sudo goaccess ../04/*.log --log-format=COMBINED --real-time-html -o informe.html

UNAME=$(uname)

if [[ $UNAME -eq "Linux" ]]
then
	xdg-open ./informe.html
else
    open ./informe.html
fi
