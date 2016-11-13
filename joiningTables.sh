#!/bin/bash

awk 'NR > 1' course.txt | sort > sCourse
awk 'NR > 1' student.txt | sort > sStudent
awk 'NR > 1' student_course.txt | sort > sStudentCourse

join sStudent sStudentCourse | awk '{print("%s %s\n", $3, $1, $2)}' | sort > list
join list sCourse > sList

echo "Sorted by Student" 
echo "studentName courseName" 
awk '{print $3 " " $4 }' sList | sort

echo "Sorted by Course" 
echo "courseName studentName" 
awk '{print  $4  " " $3 }' sList | sort
