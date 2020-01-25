#!/bin/bash 
echo "welcome to gambling simulation"
INITIAL_STAKE=100;
DAY=1;
BET=1;
WIN=1;
LOSS=0;
DAYS=20;
PERCENTAGE_STAKE=50;
#finalStake=$INITIAL_STAKE;
winCondition=$(( $INITIAL_STAKE + $(( $INITIAL_STAKE / 100 * $PERCENTAGE_STAKE )) ))
loosCondition=$(( $INITIAL_STAKE - $(( $INITIAL_STAKE / 100 * $PERCENTAGE_STAKE )) ))
function gamblerSimulator(){
for (( dayCount=1; dayCount<=DAYS; dayCount++ ))
do
	#echo "this is " $finalStake
	finalStake=$INITIAL_STAKE;
	while [ $finalStake -lt  $winCondition ] && [ $finalStake -gt $loosCondition ]
	do
		randomNumberBet=$((RANDOM%2))
		if [[ $randomNumberBet -eq $1 ]]
		then
			finalStake=$(( $finalStake + 1 ))
			#return $finalStake
		else
			finalStake=$(( $finalStake - 1 ))
			#return $finalStake
		fi
	done
	totalAmount=$(( $finalStake - $INITIAL_STAKE ))
   echo $totalAmount
	totalGamblerAmount=$(( $totalGamblerAmount + $totalAmount ))	
	echo $totalGamblerAmount
done
	echo "leavefor the day"
}

gamblerSimulator $(($WIN))
