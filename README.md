# INFO330-CreatingRelations1

A homework assignment designed to help practice creating relational database tables in SQL using a SQLite database.

## Background

The `homework.db` SQLite database is an empty database--there are no tables in here whatsoever. Your job is to create the tables for this database, and populate each table with data. Again, as with all the homework, the goal is not merely to achieve the creation of the table--the goal is to practice writing the SQL to create the tables. Thus, as with the other assignments, you must do all of the work (creating the tables as well as populating them) in SQL statements stored in script files.

**NOTE:** By putting all the work into individual script files, it will make it easier to develop the database piecemeal--write one script, run it against your database, then you can drop the database entirely and start over with the second script. This can be useful when debugging typos and other things in your scripts: for example, it's common that you run the script, there's an error with one of your INSERT statements (but the rest executed correctly), so you fix the error, run the script again, and now all your other INSERT statements fail (because you're trying to INSERT duplicate primary key values), and so does the CREATE TABLE (because the table already exists from the previous run)! This can be frustrating, so by doing it piecemeal, you can delete everything and start from scratch.

CREATE statements can also be qualified with `IF NOT EXISTS` (such as `CREATE TABLE IF NOT EXISTS tablename ...`), which tells the database to skip the CREATE statement if the table already exists. Alternatively, you can write `DROP TABLE tablename` right in front of your `CREATE TABLE tablename...` statement, and SQLite will drop any existing table (such as from a previous run) before creating the table; this is a common trick many SQL professionals and tools use, particularly since `DROP TABLE` also deletes any data stored in that table.

## Homework

You need to create five tables in the database, with varying features in each, and load some data into each table. Each one should be in its own file, whose filename is given in the title of each section (so the [Students](#students-studentssql) section should be in the file `students.sql`.)

Note that while you *could* create each of these tables as being entirely composed of "TEXT" fields, you lose the ability to impose any integrity constraints--make sure the data types you use are the *most restrictive types possible* for that kind of data. For example, an "age" field could be a TEXT, but it would be more restrictive to be an INTEGER field instead.

### Students (`students.sql`)

Create a table called "students" that has the following attributes on it:

* `id`, which needs to be an integer primary key
* `firstname`, which needs to be a string type limited to 40 characters
* `lastname`, which needs to be a string type limited to 80 characters
* `age`, which needs to be a numeric type

Insert the following data:

id | firstname | lastname | age
-- + --------- + -------- + ----
1  | Fred | Flintstone | 35
2  | Wilma | Flintstone | 29
3  | Barney | Rubble | 33
4  | Betty | Rubble | 29
5  | Pebbles | Flintstone | 1
6  | Bam-Bam | Rubble | 1

Add a few additional rows with names of your own. *(Learning how to make up credible fake data for your database is half the fun--and the pain--of working with databases!)*

### Courses (`courses.sql`)

Create a table called "courses" that has the following attributes on it:

* `code`, which needs to be a string limited to 40 characters and is a primary key
* `description`, which needs to be a string limited to 400 characters
* `start`, which needs to be a date
* `end`, which needs to be a date

In addition, make sure the following constraints are enforced:

* `code` can never be NULL and must be at least 7 characters long
* `start` and `end` can never be NULL
* the value of `end` for a given row must always be after `start`

Insert the following data:

code | start | end | description
---- | ----- | --- | ------------
INFO330A | 1 April 2023 | 1 June 2023 | Data and databases
INFO314  | 1 April 2023 | 1 June 2023 | Networking and distributed Systems
INFO448A | 25 September 2023 | 19 December 2023 | Introduction to iOS
INFO449A | 25 September 2023 | 19 Dceember 2023 | Introduction to Android
BAW010 | 1 April 2023 | 1 June 2023 | Introduction to Basket-Weaving
BAW100A | 1 April 2023 | 1 June 2023 | Underwater Basket-Weaving

Again, remember, the table types used must be the most restrictive possible, so be sure to use native SQL types for the `start` and `end` columns.

### Buildings (`buildings.sql`)

Create a table called "buildings" that has the following attributes to it:

* `name`, the full name of the building, which is a string of 80 characters
* `shortname`, a shortened reference to the building name, which is a string of 10 characters
* `id`, an integer primary key that is auto-generated by the database (that is to say, you do not specify the id when you insert values into the table)

In addition, make sure the following constraints are enforced:

* `name` can never be NULL
* `shortname` must always be unique

Buildings also have rooms, so create a *second* table, called "rooms" that has the following:

* `number`, an integer identifier for the room
* `buildingid`, an integer referring to the `buildings` primary key
* `seating`, an integer reflecting the number of open seats in the room

**NOTE:** Inserting into rooms can be tricky in a script if you don't know the auto-generated IDs for the building ahead of time, because the database is responsible for generating them. This is where a nested select can often be helpful: `INSERT INTO rooms VALUES (400, (SELECT id FROM buildings WHERE name="Mary Gates Hall"), 40);` for example.

### Student Registrations (`registrations.sql`)

Students need to be able to sign up for courses, which is a many-to-many relationship, so we need to create a table that reflects this relationship. Create a table called "student_courses" that has the following attributes:

* `studentid`, a foreign key to the student taking the course
* `course`, a foreign key to the course they are taking
* `grade`, a floating-point value that defaults to NULL when data is inserted

Make sure the following students are enrolled in the following list of courses:

* Fred Flintstone is taking INFO330A, INFO448A, and INFO314
* Barney Rubble is taking INFO330A, and INFO449A
* Wilma Flintstone is taking BAW010 and BAW100
* Betty Rubble is taking BAW010

## Stories/Rubric

* Each table is created with the appropriate data type for column, and has the required constraints established on it. (1 pt)

## Extra credit

* Let's put courses in rooms at times. (2 pts)
    * Create a new table, `timeslots`, that contain the start and end times that courses can be held and an `id` primary key. 
    * Modify `room` to have a `id` primary key.
    * Create another table, `schedule`, that has a `coursecode`, a `roomid`, and a `timeslotid`, and add an integrity constraint that requires the combination of `roomid`, and `timeslotid` to be unique--in other words, you can never have two different courses in the same room at the same time!

* 