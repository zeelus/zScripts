#!/bin/bash

ISWIN="0"
BOARD=("0" "0" "0" "0" "0" "0" "0" "0" "0")

function printBoard {
	clear
	echo "${BOARD[0]} | ${BOARD[1]} | ${BOARD[2]}"
	echo "${BOARD[3]} | ${BOARD[4]} | ${BOARD[5]}"
	echo "${BOARD[6]} | ${BOARD[7]} | ${BOARD[8]}"
}

function checkIsWin {
	for pointer in {0..2}
	do
		if [ $BOARD[pointer] -eq $BOARD[pointer + 3] && $BOARD[pointer + 3] -eq $BOARD[pointer + 6] ]
	echo "dupa"	
	fi
		
	done
	
}

while [ $ISWIN -eq "0" ]
do
printBoard
checkIsWin
done
