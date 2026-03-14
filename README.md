# Social Media Management Database

## Introduction

In the modern digital world, social media platforms generate a massive amount of user interactions, posts, and engagement data. Managing this information efficiently requires a structured and scalable database system.

This project presents a **Social Media Management Database** designed using **Oracle SQL and PL/SQL**. The database manages users, login credentials, friendships, posts, and comments while demonstrating core database concepts such as **SQL queries, joins, triggers, procedures, functions, and cursors**.

---

# Project Objectives

- Create a centralized database to manage social media users and activities
- Store and manage posts and comments efficiently
- Track friendships between users
- Implement SQL operations such as joins, subqueries, and aggregate functions
- Demonstrate PL/SQL features including triggers, procedures, functions, and cursors
- Ensure data consistency and relational integrity

---

# Database Schema

The database consists of five main tables.

## USERS Table

Stores basic information about registered users.

| Column | Type | Description |
|------|------|-------------|
| USER_ID | NUMBER | Unique identifier for each user |
| USERNAME | VARCHAR2 | Username of the user |
| USER_MOBILE | NUMBER | User mobile number |
| USER_EMAIL | VARCHAR2 | Email address |
| USER_ADDRESS | VARCHAR2 | User location |

Primary Key:
USER_ID


---

## LOGINS Table

Stores login credentials for users.

| Column | Type | Description |
|------|------|-------------|
| LOGIN_ID | NUMBER | Login identifier |
| LOGIN_USERNAME | VARCHAR2 | Username |
| USER_PASSWORD | VARCHAR2 | Password |

Primary Key:


LOGIN_ID


Foreign Key:


LOGIN_ID → USERS.USER_ID


---

## FRIENDS Table

Represents friendships between users.

| Column | Type | Description |
|------|------|-------------|
| FRIEND_ID | NUMBER | Unique friendship ID |
| USER_ID | NUMBER | User associated with the friendship |

Primary Key:


FRIEND_ID


Foreign Key:


USER_ID → USERS.USER_ID


---

## POSTS Table

Stores posts created by users.

| Column | Type | Description |
|------|------|-------------|
| POST_ID | NUMBER | Unique post ID |
| POST_CONTENT | VARCHAR2 | Content of the post |
| POST_DATE | DATE | Date the post was created |
| USER_ID | NUMBER | ID of the user who created the post |

Primary Key:


POST_ID


Foreign Key:


USER_ID → USERS.USER_ID


---

## COMMENTS Table

Stores comments on posts.

| Column | Type | Description |
|------|------|-------------|
| COMMENT_ID | NUMBER | Unique comment ID |
| USER_ID | NUMBER | User who commented |
| POST_ID | NUMBER | Post being commented on |
| COMMENT_DATE | DATE | Comment date |
| COMMENT_CONTENT | VARCHAR2 | Comment text |

Primary Key:


COMMENT_ID


Foreign Key:


POST_ID → POSTS.POST_ID


---

# Table Relationships

- A **user can create many posts**
- A **post can have many comments**
- A **user can have many friends**
- A **user has one login record**

Relationships are maintained through **primary keys and foreign keys** with **cascade delete** where necessary.

---

# SQL Features Used

The project demonstrates multiple SQL operations.

## Data Retrieval

```sql
SELECT * FROM USERS;

Conditional Queries
SELECT * FROM USERS WHERE USER_ID = 102005;

Nested Subqueries
SELECT * FROM USERS
WHERE USER_ID =
(SELECT USER_ID FROM POSTS WHERE POST_ID = 98000104);

Aggregate Functions
SELECT COUNT(*) FROM USERS;

SELECT COUNT(DISTINCT USER_ADDRESS)
FROM USERS;

SELECT MAX(USER_ID) FROM USERS;
SELECT MIN(USER_ID) FROM USERS;

GROUP BY
SELECT COUNT(*)
FROM USERS
GROUP BY USER_ADDRESS;

UNION
SELECT USERNAME FROM USERS WHERE USERNAME LIKE 'R%'
UNION
SELECT USERNAME FROM USERS WHERE USERNAME LIKE 'S%';

JOIN Operation
SELECT *
FROM USERS
NATURAL JOIN POSTS;

WITH Clause
WITH MAX_ID(VAL) AS
(
SELECT MAX(USER_ID)
FROM USERS
)
SELECT *
FROM USERS, MAX_ID
WHERE USERS.USER_ID = MAX_ID.VAL;

PL/SQL Implementation

The project includes multiple PL/SQL features.

Anonymous Block

Used to retrieve and display data.

DECLARE
FRIEND_ID FRIENDS.FRIEND_ID%TYPE;
USER_ID FRIENDS.USER_ID%TYPE;

BEGIN
SELECT FRIEND_ID, USER_ID
INTO FRIEND_ID, USER_ID
FROM FRIENDS
WHERE FRIEND_ID = 102105;

DBMS_OUTPUT.PUT_LINE('FRIEND_ID: ' || FRIEND_ID);
END;

Cursor Example

Used to iterate through table records.

DECLARE
CURSOR FRIENDS_CURSOR IS
SELECT * FROM FRIENDS;

Trigger

Automatically deletes related data when a user is deleted.

CREATE OR REPLACE TRIGGER DELETE_USER_DATA
BEFORE DELETE ON USERS
FOR EACH ROW
BEGIN

DELETE FROM LOGINS WHERE LOGIN_ID = :OLD.USER_ID;
DELETE FROM FRIENDS WHERE USER_ID = :OLD.USER_ID;
DELETE FROM POSTS WHERE USER_ID = :OLD.USER_ID;
DELETE FROM COMMENTS WHERE USER_ID = :OLD.USER_ID;

END;

Stored Procedure

Displays posts created by a user.

CREATE OR REPLACE PROCEDURE SHOW_USER_POSTS

Function

Returns post content using a post ID.

CREATE OR REPLACE FUNCTION GET_POST_CONTENT

Technologies Used

Oracle SQL

PL/SQL

Oracle Database

SQL Developer

Future Enhancements

Possible improvements for the project:

Integration with real social media platforms

Advanced analytics for engagement tracking

AI based content recommendations

Enhanced security and authentication system

Web or mobile interface for database interaction

Conclusion

The Social Media Management Database provides a structured solution for managing social media data including users, posts, friendships, and comments. By implementing SQL queries and PL/SQL features, the project demonstrates practical database design and programming concepts useful for real-world applications.

License

This project is created for educational purposes.
