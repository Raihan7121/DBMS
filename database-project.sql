SET SERVEROUTPUT ON

--DELETE TABLE

DROP TABLE COMMENTS;
DROP TABLE POSTS;
DROP TABLE FRIENDS;
DROP TABLE LOGINS;
DROP TABLE USERS;

-- TABLE CREATION

CREATE TABLE USERS(
    USER_ID NUMBER(10) NOT NULL,
    USERNAME VARCHAR2(20),
    USER_MOBILE NUMBER(11),
    USER_EMAIL VARCHAR2(50),
    USER_ADDRESS VARCHAR2(50),
    PRIMARY KEY(USER_ID)
);

CREATE TABLE LOGINS(
    LOGIN_ID NUMBER(10) NOT NULL ,
    LOGIN_USERNAME VARCHAR2(20),
    USER_PASSWORD VARCHAR2(20),
    PRIMARY KEY(LOGIN_ID),
    FOREIGN KEY(LOGIN_ID) REFERENCES USERS(USER_ID) ON DELETE CASCADE 
);
CREATE TABLE FRIENDS (
    FRIEND_ID NUMBER(10) NOT NULL,
    USER_ID NUMBER(10) NOT NULL,
    PRIMARY KEY (FRIEND_ID),
    FOREIGN KEY (USER_ID) REFERENCES USERS(USER_ID) ON DELETE CASCADE
  );
CREATE TABLE POSTS (
    POST_ID NUMBER(12) NOT NULL,
    POST_CONTENT VARCHAR2(50),
    POST_DATE DATE,
    USER_ID NUMBER(10) NOT NULL,
    PRIMARY KEY(POST_ID),
    FOREIGN KEY(USER_ID) REFERENCES USERS(USER_ID) ON DELETE CASCADE
);
CREATE TABLE COMMENTS (
    COMMENT_ID NUMBER(10) NOT NULL,
    USER_ID NUMBER(10) NOT NULL,
    POST_ID NUMBER(12) NOT NULL,
    COMMENT_DATE DATE,
    COMMENT_CONTENT VARCHAR2(50),
    PRIMARY KEY(COMMENT_ID),
    FOREIGN KEY(POST_ID) REFERENCES POSTS(POST_ID) ON DELETE CASCADE
);

-- DATA INSERTION TO TABLE

INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102001, 'PEYAL', 01307232605, 'peyal@gmail.com', 'BOGURA');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102002, 'EBRAHIM', 01007232601, 'ebrahim@gmail.com', 'PABNA');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102003, 'ARGHO', 01007232602, 'argho@gmail.com', 'SYLHET');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102004, 'POLOK', 01007232603, 'polok@gmail.com', 'THAKURGA');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102005, 'RAIHAN', 01007232604, 'raihan@gmail.com', 'DKAKA');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102006, 'OMAYER', 01307232605, 'omayer@gmail.com', 'BOGURA');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102007, 'SAKIB', 01007232601, 'sakib@gmail.com', 'PABNA');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102008, 'RIAD', 01007232602, 'riad@gmail.com', 'SYLHET');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102009, 'TAMIM', 01007232603, 'tamim@gmail.com', 'THAKURGA');
INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102010, 'SIFAT', 01007232604, 'sifat@gmail.com', 'DKAKA');


INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102001, 'PEYAL', 'p1234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102002, 'EBRAHIM', 'e1234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102003, 'ARGHO', 'a1234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102004, 'POLOK', 'p1234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102005, 'RAIHAN', 'r1234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102006, 'OMAYER', '01234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102007, 'SAKIB', 's1234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102008, 'RIAD', 'r1234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102009, 'TAMIM', 't1234');
INSERT INTO LOGINS (LOGIN_ID, LOGIN_USERNAME, USER_PASSWORD) VALUES (102010, 'SIFAT', 's1234');


INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102100, 102002);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102101, 102002);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102102, 102002);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102103, 102003);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102104, 102003);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102105, 102004);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102106, 102004);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102107, 102005);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102108, 102005);
INSERT INTO FRIENDS (FRIEND_ID, USER_ID) VALUES (102109, 102005);

INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000100, 'PATCH UPDATE', '01-JUN-2022', 102001);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000101, 'ADDED NEW PHOTO', '03-MAY-2022', 102002);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000102, 'CHANGED PROFILE NAME', '15-MAY-2022', 102002);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000103, 'SHARED NEW VIDEO', '02-JUN-2022', 102002);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000104, 'CHANGED PROFILE PHOTO', '05-APR-2022', 102003);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000105, 'SHARED A LINK', '30-APR-2022', 102003);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000106, 'ADDED NEW FPHOTOS', '15-JUN-2022', 102003);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000107, 'ADDED NEW RULES', '10-JUN-2022', 102006);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000108, 'REMOVED FEATURE', '11-MAY-2022', 102007);
INSERT INTO POSTS (POST_ID, POST_CONTENT, POST_DATE, USER_ID) VALUES (98000109, 'ADDED NEW PHOTO', '23-JUL-2022', 102009);

INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99000, 98000100, 102101);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99001, 98000101, 102102);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99002, 98000102, 102103);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99003, 98000103, 102103);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99004, 98000104, 102104);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99005, 98000105, 102104);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99006, 98000106, 102102);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99007, 98000107, 102106);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99008, 98000108, 102106);
INSERT INTO COMMENTS (COMMENT_ID, POST_ID, USER_ID) VALUES (99009, 98000109, 102109);

-- CHECKING THE EXISTING THE TABLE IN DATABASE 

SELECT TABLE_NAME FROM USER_TABLES;

-- ADD COLUMN

ALTER TABLE LOGINS ADD EMAIL CHAR(20);

-- MODIFY COLUMN

ALTER TABLE LOGINS MODIFY EMAIL VARCHAR(25);

--RENAME COLUMN

ALTER TABLE LOGINS RENAME COLUMN EMAIL TO USER_EMAIL;

-- DROP COLUMN

ALTER TABLE LOGINS DROP COLUMN USER_EMAIL;

-- DESCRIBE TABLE

DESCRIBE POSTS;

--SHOW POSTS TABLE

SELECT POST_ID, POST_CONTENT FROM POSTS;

--SHOW USER INFO

SELECT * FROM USERS WHERE USER_ID=102005;

--NESTED SUBQUERY

SELECT * FROM USERS WHERE USER_ID=(SELECT USER_ID FROM POSTS WHERE POST_ID=98000104);

--UPDATE DATA IN USERS TABLE

UPDATE USERS SET USERNAME='RAKIB' WHERE USER_ID=102005;

--ADD DATA IN USERS TABLE

INSERT INTO USERS (USER_ID, USERNAME, USER_MOBILE, USER_EMAIL, USER_ADDRESS) VALUES (102011, 'ARIFUL', 01007232604, 'sifat@gmail.com', 'DKAKA');

--DELETE ROW FROM USERS TABLE

DELETE FROM USERS WHERE USER_ID=102011;

--UNION

SELECT USERNAME FROM USERS WHERE USERNAME LIKE 'R%' UNION SELECT USERNAME FROM USERS WHERE USERNAME LIKE 'S%'; 

--AGGREGATE FUNCTION

SELECT COUNT(*) FROM USERS;

SELECT COUNT(USER_ADDRESS) AS NUMBER_OF_ADDRESS FROM USERS;

SELECT COUNT(DISTINCT USER_ADDRESS) AS NUMBER_OF_ADDRESS FROM USERS;

SELECT MAX(USER_ID) FROM USERS;

SELECT MIN(USER_ID) FROM USERS;

--GROUP BY

SELECT COUNT(*) FROM USERS GROUP BY USER_ADDRESS;

--INTERSECT

SELECT * FROM USERS WHERE USERNAME LIKE 'R%' AND USER_ADDRESS LIKE 'D%';

--STRING OPERATION

SELECT * FROM USERS WHERE USER_ADDRESS LIKE '_____'; 

--  JOIN

SELECT * FROM USERS NATURAL JOIN POSTS;

--WITH CLAUSE

WITH MAX_ID(VAL) AS (SELECT MAX(USER_ID) FROM USERS)
SELECT * FROM USERS,MAX_ID WHERE USERS.USER_ID=MAX_ID.VAL;

--VIEW

CREATE VIEW USER_DETAILS AS SELECT USER_ID, USERNAME FROM USERS;

-- PL/SQL

SET SERVEROUTPUT ON
DECLARE
FRIEND_ID FRIENDS.FRIEND_ID%TYPE;
USER_ID FRIENDS.USER_ID%TYPE;
BEGIN
SELECT FRIEND_ID,USER_ID INTO FRIEND_ID, USER_ID FROM FRIENDS WHERE FRIEND_ID=102105;
DBMS_OUTPUT.PUT_LINE('FRIEND_ID: '||FRIEND_ID||' USER_ID: '||USER_ID);
END;
/ 

--INSERT AND SET DEFAULT VALUE

SET SERVEROUTPUT ON
DECLARE
FRIEND_ID FRIENDS.FRIEND_ID%TYPE:=102110;
USER_ID FRIENDS.USER_ID%TYPE:=102001;
BEGIN
INSERT INTO FRIENDS VALUES(FRIEND_ID,USER_ID);
END;
/ 

--ROW TYPE

SET SERVEROUTPUT ON
DECLARE
FRIENDS_ROW FRIENDS%ROWTYPE;
BEGIN
SELECT FRIEND_ID,USER_ID INTO FRIENDS_ROW.FRIEND_ID,FRIENDS_ROW.USER_ID FROM FRIENDS WHERE FRIEND_ID=102105;
END;
/ 

--CURSOR AND ROW COUNT

SET SERVEROUTPUT ON
DECLARE
CURSOR FRIENDS_CURSOR IS SELECT * FROM FRIENDS;
FRIENDS_ROW FRIENDS%ROWTYPE;
BEGIN
OPEN FRIENDS_CURSOR;
FETCH FRIENDS_CURSOR INTO FRIENDS_ROW.FRIEND_ID ,FRIENDS_ROW.USER_ID;
WHILE FRIENDS_CURSOR%FOUND LOOP
DBMS_OUTPUT.PUT_LINE('FRIEND_ID: '||FRIENDS_ROW.FRIEND_ID||' USER_ID: '||FRIENDS_ROW.USER_ID);
DBMS_OUTPUT.PUT_LINE('ROW COUNT: '||FRIENDS_CURSOR%ROWCOUNT);
FETCH FRIENDS_CURSOR INTO FRIENDS_ROW.FRIEND_ID ,FRIENDS_ROW.USER_ID;
END LOOP;
CLOSE FRIENDS_CURSOR;
END;
/ 

--TRIGGER

CREATE OR REPLACE TRIGGER DELETE_USER_DATA
BEFORE DELETE ON USERS
FOR EACH ROW
BEGIN 
    DELETE FROM LOGINS WHERE LOGIN_ID = :OLD.USER_ID;
    DELETE FROM FRIENDS WHERE USER_ID = :OLD.USER_ID;
    DELETE FROM POSTS WHERE USER_ID = :OLD.USER_ID;
    DELETE FROM COMMENTS WHERE USER_ID = :OLD.USER_ID;
END;
/


--PROCEDURE

CREATE OR REPLACE PROCEDURE SHOW_USER_POSTS(
    P_USER_ID IN NUMBER,
    P_POST_ID OUT NUMBER,
    P_POST_CONTENT OUT VARCHAR2,
    P_POST_DATE OUT DATE 
)
AS
  T_SHOW CHAR(30);  
BEGIN
  T_SHOW := 'FROM PROCEDURE: ';
   
    FOR POST_REC IN (SELECT POST_ID, POST_CONTENT, POST_DATE FROM POSTS WHERE USER_ID = P_USER_ID)
    LOOP
        P_POST_ID := POST_REC.POST_ID;
	P_POST_CONTENT :=POST_REC.POST_CONTENT;
        P_POST_DATE := POST_REC.POST_DATE;
        
        DBMS_OUTPUT.PUT_LINE('POST_ID: '|| P_POST_ID ||' POST_CONTENT: ' || P_POST_CONTENT || ' POST_DATE: ' || P_POST_DATE );
    END LOOP;
    END;
/

SET SERVEROUTPUT ON
DECLARE
USER_ID USERS.USER_ID%TYPE:=102002;
POST_ID NUMBER;
POST_CONTENT VARCHAR2(50);
POST_DATE DATE;

BEGIN
    SHOW_USER_POSTS(USER_ID,POST_ID,POST_CONTENT,POST_DATE); 
END;
/

--DELETE PROCEDURE 

DROP PROCEDURE SHOW_USER_POSTS;


--FUNCTION

SET SERVEROUTPUT ON
CREATE OR REPLACE FUNCTION GET_POST_CONTENT( P_POST_ID IN NUMBER) RETURN VARCHAR2
AS
    V_POST_CONTENT POSTS.POST_CONTENT%TYPE;
BEGIN
       SELECT POST_CONTENT INTO V_POST_CONTENT FROM POSTS WHERE POST_ID = P_POST_ID;

       RETURN V_POST_CONTENT;
END;
/

SET SERVEROUTPUT ON
DECLARE
    POST_ID NUMBER(10) :=98000104;
    POST_CONTENT VARCHAR2(50);
BEGIN
    POST_CONTENT := GET_POST_CONTENT(POST_ID);
    DBMS_OUTPUT.PUT_LINE('POST CONTENT: ' || POST_CONTENT);
END;
/


--DELETE FUNCTION

DROP FUNCTION GET_COMMENT_CONTENT;





 
