#!/bin/bash

awk 'NR > 1' course.txt | sort > sCourse
awk 'NR > 1' student.txt | sort > sStudent
awk 'NR > 1' student_course.txt | sort > sStudentCourse

join sStudent sStudentCourse | awk '{print("%s %s\n", $3, $1, $2)}' | sort > list
join list sCourse > sList

clear

echo ""
echo " --- Sorted by Student ---  " 
echo "|--------------------------|" 
echo "| studentName | courseName |" 
echo "|--------------------------|" 
awk '{print "|  " $3 "\t" "      | " $4 "\t" "   |" }' sList | sort
echo "|--------------------------|" 
echo ""

echo ""
echo "  --- Sorted by Course ---  " 
echo "|--------------------------|" 
echo "| courseName | studentName |" 
echo "|--------------------------|" 
awk '{print "|  " $4 "   |  " $3 "\t" "   |"}' sList | sort
echo "|--------------------------|" 
echo ""
