#!/bin/bash
#
# this script rolls a six-sided die
#


echo -n " You are rolling a pair of six-sided dice
Rolling...
It shows $(( RANDOM % 6 + 1)) rolled
"

# Task: Improve this script by making it roll as many dice as there are letters in your first name, instead of just one
echo ""
name=JIALIANG
for((i=0;i<${#name};i++))
do
	echo -n "You are rolling a  You are rolling a pair of six-sided dice
	Rolling...
	It shows $(( RANDOM % 6 + 1)) rolled
	"
done

# roll the dice and display the result

echo -n " You are rolling a pair of ten-sided dice
Rolling...
It shows $(( RANDOM % 10 + 1)) rolled
"
