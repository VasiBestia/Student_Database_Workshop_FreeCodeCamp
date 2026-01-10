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
👨‍💻 Author
Vasilescu Alexandru Gabriel

Certification: Relational Database (Beta)
