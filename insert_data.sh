#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

cat courses.csv | while IFS="," read MAJOR COURSE
do
  if [[ $MAJOR != "major" ]]
  then
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    if [[ -z $MAJOR_ID ]]
    then
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
    fi
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    if [[ -z $COURSE_ID ]]
    then
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
    fi
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
  fi
done

cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    if [[ -z $MAJOR_ID ]]
    then
      MAJOR_ID=null
    fi
    INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name, last_name, major_id, gpa) VALUES('$FIRST','$LAST',$MAJOR_ID,$GPA)")
  fi
done
