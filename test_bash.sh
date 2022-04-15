#!/bin/bash

# 
q1="Do you want to proceed? (y/[n]): ";
prompt_yes_or_no_question () {

while true; do

read -p "$q1" yn

case $yn in 

	y | Y | [Yy]es | YES ) 	

				echo "```\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/```"
				echo ok, we will proceed;

				break;;

	n | N | [nN]o | NO | "" ) 	
				
				echo exiting...;

				exit;;
	* ) 			
				

				echo provide a yes or no answer!;;
esac

done

echo succeeding ...
}


prompt_yes_or_no_question
