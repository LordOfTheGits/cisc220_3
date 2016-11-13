#!/bin/bash

perms=($(ls -l | awk '{print $1}')) #array with permisions for all files in current dir
names=($(ls -l | awk '{print $9}')) #array with names of all files in current dir

len=${#names[*]} #number of files in current dir

#for loop that will go through all the files in the current directory
for (( i=0 ; i<len ; i++ )) ; do

	#ex will have a value of 0 if the file is not executable
	ex=$(expr index "${perms[$((i+1))]}" "x")

	#if the file is executable the find the #!/bin/bash line
	#incase it isn't the first line
	if [[ ! $ex == 0 ]]; then

		#sed commmand to add "#Developed in cisc220" after the #!/bin/bash line
		sed -i '1 a\#Developed in cisc220' ${names[i]} ;

	fi #end if

done #end for loop