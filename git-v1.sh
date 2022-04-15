#!/bin/bash
#set -e
##################################################################################################################
# reset - commit your changes or stash them before you merge
# git reset --hard

# checking if I have the latest files from github

while true; do

read -p "pull latest changes from remote repo? (y/[n])? " answer

case $answer in
	y | Y | [Yy]es | YES )  

		echo "pulling ...";

		git pull

		break;;

	n | N | [nN]o | NO | "" ) 
		

		read -p "commit and push the changes (y/[n])? " commit_push_yes_no
		


		case $commit_push_yes_no in

			y | Y | [Yy]es | YES )  
			
			echo "staging changed files to be commited ..."

			# Below command will backup everything inside the project folder
			git add --all .

			# commit the changes
			echo ".............................................."
			echo "............. Write your commit! ............."
			echo ".............................................."

			read input

			# Committing to the local repository with a message containing the time details and commit text

			git commit -m "$input"

			# Push the local files to github


			if grep -q main .git/config; then
				echo "Using main"
				git push -u origin main
			fi

			if grep -q master .git/config; then
				echo "Using master"
				git push -u origin master
			fi

			echo ".............................................."
			echo "....... Changes pushed to remote repo! ......."
			echo ".............................................."
			exit;;

			n | N | [nN]o | NO | "" ) 
				exit;;
		esac
		;;




	* ) echo "provide a yes or no answer ...";;
esac


done

