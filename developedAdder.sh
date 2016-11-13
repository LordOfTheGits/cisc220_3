#!/bin/bash

perms=($(ls -l | awk '{print $1}')) #array with permisions for all files in current dir
names=($(ls -l | awk '{print $9}')) #array with names of all files in current dir

len=${#perms[*]} #number of files in current dir

str="#!/bin/bash"  

#for loop that will go through all the files in the current directory
for (( i=1 ; i<len ; i++ )) ; do

	#ex will have a value of 0 if the file is not executable
	ex=$(expr index "${perms[i]}" "x")

	#if the file is executable the find the #!/bin/bash line
	#incase it isn't the first line
	if [[ ! $ex == 0 ]]; then

		#loc to tell if the file has a #!/bin/bash line
		loc=$(grep -n "$str" ${names[i]})
		loc=${loc:0:1}

		if  [[ $loc == 1 ]]; then

			#sed commmand to add "#Developed in cisc220" after the #!/bin/bash line
			sed -i '1 a\#Developed in cisc220' ${names[i]} ;

		fi; #end if

	fi #end if

done #end for loop