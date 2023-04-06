# INFO330-CreatingRelations1

A homework assignment designed to help practice creating relational database tables in SQL using a SQLite database.

## Background

The `homework.db` SQLite database is an empty database--there are no tables in here whatsoever. Your job is to create the tables for this database, and populate each table with data. Again, as with all the homework, the goal is not merely to achieve the creation of the table--the goal is to practice writing the SQL to create the tables. Thus, as with the other assignments, you must do all of the work (creating the tables as well as populating them) in SQL statements stored in script files.

**NOTE:** By putting all the work into individual script files, it will make it easier to develop the database piecemeal--write one script, run it against your database, then you can drop the database entirely and start over with the second script. This can be useful when debugging typos and other things in your scripts: for example, it's common that you run the script, there's an error with one of your INSERT statements (but the rest executed correctly), so you fix the error, run the script again, and now all your other INSERT statements fail (because you're trying to INSERT duplicate primary key values), and so does the CREATE TABLE (because the table already exists from the previous run)! This can be frustrating, so by doing it piecemeal, you can delete everything and start from scratch.

CREATE statements can also be qualified with `IF NOT EXISTS` (such as `CREATE TABLE IF NOT EXISTS tablename ...`), which tells the database to skip the CREATE statement if the table already exists. Alternatively, you can write `DROP TABLE tablename` right in front of your `CREATE TABLE tablename...` statement, and SQLite will drop any existing table (such as from a previous run) before creating the table; this is a common trick many SQL professionals and tools use, particularly since `DROP TABLE` also deletes any data stored in that table.

## Homework

You need to create five tables in the database, with varying features in each, and load some data into each table. Each one should be in its own file, whose filename is given in the title of each section (so the [Persons](#persons-personssql) section should be in the file `persons.sql`.)

Note that while you *could* create each of these tables as being entirely composed of "TEXT" fields, you lose the ability to impose any integrity constraints--make sure the data types you use are the *most restrictive types possible* for that kind of data. For example, an "age" field could be a TEXT, but it would be more restrictive to be an INTEGER field instead.

### Persons (`persons.sql`)

Create a table called "persons" that has the following attributes on it:

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

### Courses (`courses.sql`)

Create a table called "courses" that has the following attributes on it:

* `code`, which needs to be a string limited to 40 characters
* `description`, which needs to be a string limited to 400 characters
* `start`, which needs to be a date
* `end`, which needs to be a date

In addition, make sure the following constraints are enforced:

* `code` values must be unique and can never be NULL
* the value of `end` for a given row must always be after `start`

### Buildings

### 

## Stories/Rubric

* Each table is created with the appropriate data type for column. (1 pt)

## Extra credit

* 