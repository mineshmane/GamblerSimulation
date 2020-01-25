#!/bin/bash -x
echo "welcome to gambling simulation"
INITIAL_STAKE=100;
DAY=1;
BET=1;
WIN=1;
LOSS=0;
finalStake=INITIAL_STAKE;
function GamblerSimulator(){

	randomNumberBet=$((RANDOM%2))
	if [[ $randomNumberBet -eq $1 ]]
	then
		finalStake=$(( $finalStake + 1 ))
		return $finalStake
	else
		finalStake=$(( $finalStake - 1 ))
		return $finalStake
	fi
}

GamblerSimulator $(($WIN))
