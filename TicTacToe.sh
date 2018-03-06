#!/bin/bash

ISWIN="0"
BOARD=("0" "0" "0" "0" "0" "0" "0" "0" "0")
INPUT=""
PLAYER="1"

function printBoard {
	
	echo "${BOARD[0]} | ${BOARD[1]} | ${BOARD[2]}"
	echo "${BOARD[3]} | ${BOARD[4]} | ${BOARD[5]}"
	echo "${BOARD[6]} | ${BOARD[7]} | ${BOARD[8]}"
}

function checkIsWin {
	for pointer in {0..2}
	do


		if [ "${BOARD[$pointer]}" == "${BOARD[$(($pointer + 3))]}" ] && [ "${BOARD[$(($pointer + 3))]}" == "${BOARD[$(($pointer + 6))]}" ] && [ "${BOARD[$(($pointer + 3))]}" != "0" ]
			then
			ISWIN="1"
		fi

		if [ "${BOARD[$(($pointer * 3))]}" == "${BOARD[$(($pointer * 3 + 1))]}" ] && [ "${BOARD[$(($pointer * 3 + 1))]}" == "${BOARD[$(($pointer * 3 + 2))]}" ] && [ "${BOARD[$(($pointer * 3))]}" != "0" ]
			then
			ISWIN="1"
		fi

	done

	if [ ${BOARD[0]} == ${BOARD[4]} ] && [ ${BOARD[4]} == ${BOARD[8]} ] && [ ${BOARD[0]} != "0" ]
		then
		ISWIN="1"
	fi

	if [ ${BOARD[6]} == ${BOARD[4]} ] && [ ${BOARD[4]} == ${BOARD[2]} ] && [ ${BOARD[6]} != "0" ]
		then
		ISWIN="1"
	fi
	
}

function getInput {
	echo "Player ${PLAYER}"
	echo "Set number: "
	read INPUT
}

function setBoard {
	if [ $PLAYER -eq "1" ]
		then
		BOARD[$INPUT]="O"
	else
		BOARD[$INPUT]="X"
	fi
}

function changePlayer {
	if [ $PLAYER -eq "1" ]
		then
		PLAYER="2"
	else
		PLAYER="1"
	fi
}

I=0

while [ $ISWIN -eq "0" ]
do
	printBoard
	getInput
	if [ $INPUT -lt 0 ] || [ $INPUT -gt 8 ] || [ "${BOARD[$INPUT]}" != "0" ]
		then
		continue
	fi
	setBoard
	checkIsWin
	changePlayer
	I=$((I+1))
	if [ $I -eq 9 ] 
		then
		echo "DRAW"
		exit 0
	fi
done


printBoard
changePlayer
echo "Player ${PLAYER} WON!"