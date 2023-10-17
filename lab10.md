# Lab 10 JOIN and Grouping Functions

## MySQL with Docker

```bash
# Connect to MySQL in the docker container
$ docker-compose exec db bash
$ mysql -u root -p
```

```bash
# Backup 2 MySQL database to a file
# There's no space between -p and [password]
# docker exec -it [ontainer_name_or_id] mysqldump -u[user] -p[password] --databases [database1_name][database2_name] > backup.sql
$ docker exec -it csc350-php-mysql-labs-db-1 mysqldump -u root -prootpassword --databases forum banking > ./db/backup-lab10.sql
```

## Lab Task

Make the 2 databases below along with tables and insert values to them as mentioned below
add 5 more records to accounts and customers tables

```sql
CREATE DATABASE forum CHARACTER SET utf8 COLLATE utf8_general_ci;

USE forum;

CREATE TABLE forums (
forum_id TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(60) NOT NULL,
PRIMARY KEY (forum_id),
UNIQUE (name)
) ENGINE = INNODB;

CREATE TABLE messages (
message_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
parent_id INT UNSIGNED NOT NULL DEFAULT 0,
forum_id TINYINT UNSIGNED NOT NULL,
user_id MEDIUMINT UNSIGNED NOT NULL,
subject VARCHAR(100) NOT NULL,
body LONGTEXT NOT NULL,
date_entered DATETIME NOT NULL,
PRIMARY KEY (message_id),
INDEX (parent_id),
INDEX (forum_id),
INDEX (user_id),
INDEX (date_entered)
) ENGINE = MYISAM;

CREATE TABLE users (
user_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
username VARCHAR(30) NOT NULL,
pass CHAR(40) NOT NULL,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
email VARCHAR(60) NOT NULL,
PRIMARY KEY (user_id),
UNIQUE (username),
UNIQUE (email),
INDEX login (pass, email)
) ENGINE = INNODB;

INSERT INTO forums (name) VALUES 
('MySQL'), ('PHP'), ('Sports'), 
('HTML'), ('CSS'), ('Kindling'); 
INSERT INTO forums (name) VALUES ('Modern Dance');

INSERT INTO users (username, pass, first_name, last_name, email) VALUES 
('troutster', SHA1('mypass'), 'Larry', 'Ullman', 'lu@example.com'),
('funny man', SHA1('monkey'), 'David', 'Brent', 'db@example.com'),
('Gareth', SHA1('asstmgr'), 'Gareth', 'Keenan', 'gk@example.com');
INSERT INTO users (username, pass, first_name, last_name, email) VALUES 
('tim', SHA1( 'psych' ) , 'Tim', 'Canterbury', 'tc@example.com'),
('finchy', SHA1('jerk'), 'Chris', 'Finch', 'cf@example.com');

INSERT INTO messages (parent_id, forum_id, user_id, subject, body, date_entered) VALUES
(0, 1, 1, 'Question about normalization.', 'I''m confused about normalization. For the second normal form (2NF), I read...', UTC_TIMESTAMP()),
(0, 1, 2, 'Database Design', 'I''m creating a new database and am having problems with the structure. How many tables should I have?...', UTC_TIMESTAMP()),
(2, 1, 2, 'Database Design', 'The number of tables your database includes...', UTC_TIMESTAMP()),
(0, 1, 3, 'Database Design', 'Okay, thanks!', UTC_TIMESTAMP()),
(0, 2, 3, 'PHP Errors', 'I''m using the scripts from Chapter 3 and I can''t get the first calculator example to work. When I submit the form...', UTC_TIMESTAMP());
INSERT INTO messages (parent_id, forum_id, user_id, subject, body, date_entered) VALUES
(5, 2, 1, 'PHP Errors', 'What version of PHP are you using?', UTC_TIMESTAMP()),
(6, 2, 3, 'PHP Errors', 'Version 5.2', UTC_TIMESTAMP()),
(7, 2, 1, 'PHP Errors', 'In that case, try the debugging steps outlined in Chapter 7.', UTC_TIMESTAMP()),
(0, 3, 2, 'Chicago Bulls', 'Can the Bulls really win it all this year?', UTC_TIMESTAMP()),
(9, 3, 1, 'Chicago Bulls', 'I don\'t know, but they sure look good!', UTC_TIMESTAMP()),
(0, 5, 3, 'CSS Resources', 'Where can I found out more information about CSS?', UTC_TIMESTAMP()),
(11, 5, 1, 'CSS Resources', 'Read Elizabeth Castro''s excellent book on (X)HTML and CSS. Or search Google on "CSS".', UTC_TIMESTAMP()),
(0, 4, 3, 'HTML vs. XHTML', 'What are the differences between HTML and XHTML?', UTC_TIMESTAMP()),
(13, 4, 1, 'HTML vs. XHTML', 'XHTML is a cross between HTML and XML. The differences are largely syntactic. Blah, blah, blah...', UTC_TIMESTAMP()),
(0, 6, 4, 'Why?', 'Why do you have a forum dedicated to kindling? Don''t you deal mostly with PHP, MySQL, and so forth?', UTC_TIMESTAMP()),
(0, 2, 3, 'Dynamic HTML using PHP', 'Can I use PHP to dynamically generate HTML on the fly? Thanks...', UTC_TIMESTAMP()),
(16, 2, 1, 'Dynamic HTML using PHP', 'You most certainly can.', UTC_TIMESTAMP()),
(17, 2, 3, 'Dynamic HTML using PHP, still not clear', 'Um, how?', UTC_TIMESTAMP()),
(18, 2, 2, 'Dynamic HTML using PHP, clearer?', 'I think what Larry is trying to say is that you should buy and read his book.', UTC_TIMESTAMP()),
(15, 6, 4, 'Why? Why? Why?', 'Really, why?', UTC_TIMESTAMP()),
(20, 6, 1, 'Because', 'Because', UTC_TIMESTAMP());
```

```sql
CREATE DATABASE banking CHARACTER SET utf8 COLLATE utf8_general_ci;

USE banking;

CREATE TABLE customers (
customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
PRIMARY KEY (customer_id),
INDEX full_name (last_name, first_name)
) ENGINE = INNODB;

CREATE TABLE accounts (
account_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
customer_id INT UNSIGNED NOT NULL,
type ENUM('Checking', 'Savings') NOT NULL,
balance DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
PRIMARY KEY (account_id),
INDEX (customer_id),
FOREIGN KEY (customer_id) REFERENCES customers (customer_id) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = INNODB;

CREATE TABLE transactions (
transaction_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
to_account_id INT UNSIGNED NOT NULL,
from_account_id INT UNSIGNED NOT NULL,
amount DECIMAL(5,2) UNSIGNED NOT NULL,
date_entered TIMESTAMP NOT NULL,
PRIMARY KEY (transaction_id),
INDEX (to_account_id),
INDEX (from_account_id),
INDEX (date_entered),
FOREIGN KEY (to_account_id) REFERENCES accounts (account_id)
ON DELETE NO ACTION ON UPDATE NO ACTION,
FOREIGN KEY (from_account_id) REFERENCES accounts (account_id) 
ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = INNODB;

INSERT INTO customers (first_name, last_name) 
VALUES ('Sarah', 'Vowell'), ('David', 'Sedaris'), ('Kojo', 'Nnamdi');

INSERT INTO accounts (customer_id, balance) 
VALUES (1, 5460.23), (2, 909325.24), (3, 892.00);
INSERT INTO accounts (customer_id, type, balance) 
VALUES (2, 'Savings', 13546.97);
```

### WHAT YOU NEED TO SUBMIT IS:
1. Find the average balance of every user in the account's table. Use group_by.
2. Select the subject, and body from table messages and forum_id from table forums and join them together.
3. Find the summation balance of every account in accounts table.

```bash
# Find the average balance of every user in the account's table. Use group_by.
mysql> USE banking; # Switch to banking database
mysql> SELECT customer_id, AVG(balance) FROM accounts GROUP BY customer_id;
+-------------+---------------+
| customer_id | AVG(balance)  |
+-------------+---------------+
|           1 |   5460.230000 |
|           2 | 461436.105000 |
|           3 |    892.000000 |
+-------------+---------------+
3 rows in set (0.01 sec)
```

```bash
# Select the subject, and body from table messages and forum_id from table forums and join them together.
mysql> USE forum; # Switch to forum database
mysql> SELECT f.forum_id, m.subject, m.body FROM messages AS m INNER JOIN forums AS f ON m.forum_id = f.forum_id;
+----------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------+
| forum_id | subject                                 | body                                                                                                                 |
+----------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------+
|        5 | CSS Resources                           | Where can I found out more information about CSS?                                                                    |
|        5 | CSS Resources                           | Read Elizabeth Castro's excellent book on (X)HTML and CSS. Or search Google on "CSS".                                |
|        4 | HTML vs. XHTML                          | What are the differences between HTML and XHTML?                                                                     |
|        4 | HTML vs. XHTML                          | XHTML is a cross between HTML and XML. The differences are largely syntactic. Blah, blah, blah...                    |
|        6 | Why?                                    | Why do you have a forum dedicated to kindling? Don't you deal mostly with PHP, MySQL, and so forth?                  |
|        6 | Why? Why? Why?                          | Really, why?                                                                                                         |
|        6 | Because                                 | Because                                                                                                              |
|        1 | Question about normalization.           | I'm confused about normalization. For the second normal form (2NF), I read...                                        |
|        1 | Database Design                         | I'm creating a new database and am having problems with the structure. How many tables should I have?...             |
|        1 | Database Design                         | The number of tables your database includes...                                                                       |
|        1 | Database Design                         | Okay, thanks!                                                                                                        |
|        2 | PHP Errors                              | I'm using the scripts from Chapter 3 and I can't get the first calculator example to work. When I submit the form... |
|        2 | PHP Errors                              | What version of PHP are you using?                                                                                   |
|        2 | PHP Errors                              | Version 5.2                                                                                                          |
|        2 | PHP Errors                              | In that case, try the debugging steps outlined in Chapter 7.                                                         |
|        2 | Dynamic HTML using PHP                  | Can I use PHP to dynamically generate HTML on the fly? Thanks...                                                     |
|        2 | Dynamic HTML using PHP                  | You most certainly can.                                                                                              |
|        2 | Dynamic HTML using PHP, still not clear | Um, how?                                                                                                             |
|        2 | Dynamic HTML using PHP, clearer?        | I think what Larry is trying to say is that you should buy and read his book.                                        |
|        3 | Chicago Bulls                           | Can the Bulls really win it all this year?                                                                           |
|        3 | Chicago Bulls                           | I don't know, but they sure look good!                                                                               |
+----------+-----------------------------------------+----------------------------------------------------------------------------------------------------------------------+
21 rows in set (0.00 sec)
```

```bash
# Find the summation balance of every account in accounts table.
mysql> USE banking; # Switch to banking database
mysql> SELECT SUM(balance) FROM accounts;
+--------------+
| SUM(balance) |
+--------------+
|    929224.44 |
+--------------+
1 row in set (0.01 sec)
```
