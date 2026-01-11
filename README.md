# 🎓 Student Database: Part 1

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Bash](https://img.shields.io/badge/Bash_Scripting-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Validation-orange?style=for-the-badge)
![freeCodeCamp](https://img.shields.io/badge/freeCodeCamp-Certified-black?style=for-the-badge&logo=freecodecamp)

## 📖 Overview

This project is part of the **Relational Database Certification** by freeCodeCamp. It involves building an interactive student management system using **PostgreSQL** for data storage and **Bash** scripts for automation and data entry.

The goal of the project is to demonstrate how to programmatically interface with a relational database using shell scripting, manage complex table relationships, and perform CRUD operations efficiently.

---

## 🗂️ Database Schema

The database `students` is designed with normalization in mind, featuring a **Many-to-Many** relationship between Majors and Courses.

### 1. `students` (Main Table)
Contains personal and academic information about students.
- **Columns:** `student_id` (PK), `first_name`, `last_name`, `major_id` (FK), `gpa`.

### 2. `majors`
Stores the available academic majors.
- **Columns:** `major_id` (PK), `major`.

### 3. `courses`
Stores the catalog of available courses.
- **Columns:** `course_id` (PK), `course`.

### 4. `majors_courses` (Junction Table)
Resolves the **Many-to-Many** relationship between Majors and Courses (since a major includes multiple courses, and a course can belong to multiple majors).
- **Columns:** `major_id` (FK), `course_id` (FK).

---

## 🛠️ Key Features & Learnings

* **Bash & SQL Integration:** Using the `$PSQL` variable to run SQL commands directly from the terminal and scripts.
* **Relational Logic:** Implementing **Foreign Keys** to link students to majors and majors to courses.
* **Data Insertion Scripting:** Automating the population of the database using Bash loops and conditional logic.
* **Data Integrity:** Enforcing constraints like `NOT NULL` and `UNIQUE` to ensure data quality.
* **Querying:** Writing complex `JOIN` queries to retrieve meaningful data (e.g., "List all courses for the Computer Science major").

---

## 🚀 How to Run

To run this project locally, you need **PostgreSQL** and a Bash terminal.

### 1. Clone the Repository
```bash
git clone [https://github.com/YourUsername/student-database-part-1.git](https://github.com/YourUsername/student-database-part-1.git)
cd student-database-part-1
```
2. Set up the Database
Log in to the PostgreSQL terminal:

```bash

psql --username=freecodecamp --dbname=postgres
```
Create the database and connect to it:

```sql

CREATE DATABASE students;
\c students
```
3. Run the Build Script
Execute the main Bash script to build the tables and insert the data automatically:

```bash

./insert_data.sh
```
4. Query the Data
You can now run queries or use the provided query script (if applicable):

```bash

./student_info.sh
```
---
🧪 Example Usage
Here is a snippet of how the Bash script inserts data into the junction table majors_courses:

```bash

# Get Major_ID and Course_ID
MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

# Insert into junction table
INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id, course_id) VALUES($MAJOR_ID, $COURSE_ID)")
```
---
## 📊 Part 2: Student Database Analysis

This section covers the second phase of the FreeCodeCamp workshop, which focuses on querying, analyzing, and extracting insights from the `students` database created in Part 1.

### 📂 Script: `student_info.sh`
The core of this phase is the bash script `student_info.sh`. It connects to the PostgreSQL database and executes a series of queries to generate reports on student performance, course enrollment, and major distribution.

### 🧠 Key SQL Concepts Implemented
The script demonstrates mastery of intermediate to advanced SQL techniques, including:

* **Advanced Filtering:** Combining logic with `AND`/`OR`, checking for `NULL` values, and using comparison operators (`<`, `>`, `=`).
* **Pattern Matching:** Utilizing `LIKE` and `ILIKE` (case-insensitive) with wildcards:
    * `%`: Matches any sequence of characters.
    * `_`: Matches a single character.
* **Aggregations & Math:** Calculating averages (`AVG`), counting records (`COUNT`), and formatting numbers using `ROUND`.
* **Grouping Data:** Using `GROUP BY` to segment data and `HAVING` to filter those groups based on aggregate conditions.
* **Complex Joins:**
    * **`INNER JOIN`**: To find matching records across tables.
    * **`LEFT` / `RIGHT JOIN`**: To identify students without majors or courses without students.
    * **`FULL JOIN`**: To retrieve all records from both tables, matching where possible.



### 🏃‍♂️ How to Run
To execute the analysis script and view the generated report, run the following command in your terminal:

```bash
./student_info.sh
```
---
👨‍💻 Author
Vasilescu Alexandru Gabriel

Certification: Relational Database (Beta)
