#!/bin/bash 
echo "welcome to gambling simulation"
INITIAL_STAKE=100;
DAY=1;
BET=1;
WIN=1;
LOSS=0;
DAYS=30;
PERCENTAGE_STAKE=50;
winCount=0;
winTotalAmount=0;
loassTotalAmount=0;
lossCount=0;
#finalStake=$INITIAL_STAKE;
declare -A gamblerAmount
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

		dailyAmount=$(( $finalStake - $INITIAL_STAKE ))
		finalDailyAmount=$(( $finalDailyAmount + $dailyAmount ))
		gamblerAmount[$dayCount]=$dailyAmount
		gamblerSimulator[$dayCount]=$finalDailyAmount
		totalGamblerAmount=$(( $totalGamblerAmount + $dailyAmount ))
done
	echo "leavefor the day"
	
	for data in "${!gamblerAmount[@]}"
	do
		if [[ ${gamblerAmount[$data]} -lt $LOSS ]]
		then
			lossCount=$(( $lossCount + 1 ))
			lossdailyAmount=$(( $lossdailyAmount + ${gamblerAmount[$data]} ))
		else
			winCount=$(( $winCount + 1 ));
			windailyAmount=$(( $windailyAmount + ${gamblerAmount[$data]} ))

		fi


	done
		luckiestValue=$( printf "%s\n" ${gamblerSimulator[@]} | sort -nr | head -1 )
		unluckiestValue=$( printf "%s\n" ${gamblerSimulator[@]} | sort -nr | tail -1 )
		echo "loss Count:" $lossCount  "lossAmount:" $lossdailyAmount
		echo "win count :" $winCount "winAmount:"  $windailyAmount
		findDayOfLuckyAndUnlucky $luckiestValue $unluckiestValue 

}

function findDayOfLuckyAndUnlucky(){
		for data in "${!gamblerSimulator[@]}"
	do
		if [[ ${gamblerSimulator[$data]} -eq $1 ]]
		then
			echo "lucky Day" $data
		elif [[ ${gamblerSimulator[$data]} -eq $2 ]]
		then
			echo "unlucky Day" $data
		fi
	done
}

gamblerSimulator $(($WIN))
