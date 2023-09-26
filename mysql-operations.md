# MySQL basic operations

```bash
# Connect to MySQL in the docker container
$ docker-compose exec db bash
$ mysql -u root -p
```

```bash
# Backup MySQL database to a file
# There's no space between -p and [password]
# docker exec -it [ontainer_name_or_id] mysqldump -u[user] -p[password] [database_name] > backup.sql
$ docker exec -it csc350-php-labs-db-1 mysqldump -u root -prootpassword sitename > ./db/backup-mysql-operations-lab8.sql
```


```bash
# Show databases in MySQL
mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| my_database        |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.04 sec)
```

```bash
# Create a Database in MySQL
mysql> CREATE DATABASE sitename;
Query OK, 1 row affected (0.02 sec)

# Use sitename Database
mysql> USE sitename;
Database changed
mysql> STATUS;
--------------
mysql  Ver 8.0.34 for Linux on aarch64 (MySQL Community Server - GPL)

Connection id:          8
Current database:       sitename
Current user:           root@localhost
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         8.0.34 MySQL Community Server - GPL
Protocol version:       10
Connection:             Localhost via UNIX socket
Server characterset:    utf8mb4
Db     characterset:    utf8mb4
Client characterset:    latin1
Conn.  characterset:    latin1
UNIX socket:            /var/run/mysqld/mysqld.sock
Binary data as:         Hexadecimal
Uptime:                 19 min 38 sec

Threads: 2  Questions: 22  Slow queries: 0  Opens: 139  Flush tables: 3  Open tables: 58  Queries per second avg: 0.018
--------------

```

```bash
# Create a users Table
mysql> CREATE TABLE users (
    -> user_id MEDIUMINT UNSIGNED NOT NULL AUTO_INCREMENT,
    -> first_name VARCHAR(20) NOT NULL,
    -> last_name VARCHAR(40) NOT NULL,
    -> email VARCHAR(60) NOT NULL,
    -> pass CHAR(40) NOT NULL,
    -> registration_date DATETIME NOT NULL,
    -> PRIMARY KEY (user_id)
    -> );
Query OK, 0 rows affected (0.05 sec)
```

```bash
# Show tables
mysql> SHOW TABLES;
+--------------------+
| Tables_in_sitename |
+--------------------+
| users              |
+--------------------+
1 row in set (0.01 sec)

mysql> SHOW COLUMNS FROM users;
+-------------------+--------------------+------+-----+---------+----------------+
| Field             | Type               | Null | Key | Default | Extra          |
+-------------------+--------------------+------+-----+---------+----------------+
| user_id           | mediumint unsigned | NO   | PRI | NULL    | auto_increment |
| first_name        | varchar(20)        | NO   |     | NULL    |                |
| last_name         | varchar(40)        | NO   |     | NULL    |                |
| email             | varchar(60)        | NO   |     | NULL    |                |
| pass              | char(40)           | NO   |     | NULL    |                |
| registration_date | datetime           | NO   |     | NULL    |                |
+-------------------+--------------------+------+-----+---------+----------------+
6 rows in set (0.02 sec)
```

```bash
# Insert records into the users Table
mysql> INSERT INTO users
    -> (first_name, last_name, email, pass, registration_date)
    -> VALUES ('Jake', 'Li', 'jakeli@mail.com', SHA1('mypass'), NOW());
Query OK, 1 row affected (0.04 sec)
```

```bash
# Select all records from the users Table
mysql> SELECT * FROM users;
+---------+------------+-----------+-----------------+------------------------------------------+---------------------+
| user_id | first_name | last_name | email           | pass                                     | registration_date   |
+---------+------------+-----------+-----------------+------------------------------------------+---------------------+
|       1 | Jake       | Li        | jakeli@mail.com | e727d1464ae12436e899a726da5b2f11d8381b26 | 2023-09-26 19:22:37 |
+---------+------------+-----------+-----------------+------------------------------------------+---------------------+
1 row in set (0.00 sec)

mysql> SELECT first_name, last_name FROM users;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Jake       | Li        |
+------------+-----------+
1 row in set (0.02 sec)

```

---

## Task 1

Write a query to select all data with "mypass" password

```bash
mysql> SELECT * FROM users WHERE pass = SHA1('mypass');
+---------+------------+-----------+-----------------+------------------------------------------+---------------------+
| user_id | first_name | last_name | email           | pass                                     | registration_date   |
+---------+------------+-----------+-----------------+------------------------------------------+---------------------+
|       1 | Jake       | Li        | jakeli@mail.com | e727d1464ae12436e899a726da5b2f11d8381b26 | 2023-09-26 19:22:37 |
+---------+------------+-----------+-----------------+------------------------------------------+---------------------+
1 row in set (0.01 sec)
```

## Task 2

Create a new table called "customers" with below columns and properties:
customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
first_name VARCHAR(20) NOT NULL,
last_name VARCHAR(40) NOT NULL,
PRIMARY KEY (customer_id)

```bash
mysql> CREATE TABLE customers (
    -> customer_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    -> first_name VARCHAR(20) NOT NULL,
    -> last_name VARCHAR(40) NOT NULL,
    -> PRIMARY KEY (customer_id)
    -> );
Query OK, 0 rows affected (0.06 sec)
```

## Task 3

create a new table called "accounts"  with below columns and properties:
account_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
customer_id INT UNSIGNED NOT NULL
type ENUM('Checking', 'Savings') NOT NULL
balance DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0.0
PRIMARY KEY (account_id)

```bash
mysql> CREATE TABLE accounts (
    -> account_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
    -> customer_id INT UNSIGNED NOT NULL,
    -> type ENUM('Checking', 'Savings') NOT NULL,
    -> balance DECIMAL(10,2) UNSIGNED NOT NULL DEFAULT 0.0,
    -> PRIMARY KEY (account_id)
    -> );
Query OK, 0 rows affected, 1 warning (0.05 sec)
```

## Task 4

Insert records below to each table

customers

| first_name | last_name |
| ---------- | --------- |
| Sarah      | Vowell    |
| David      | Sedaris   |
| Kojo       | Nnamdi   |

accounts

| customer_id | balance   |
| ----------- | --------- |
| 1           | 5460.23   |
| 2           | 909325.24 |
| 3           | 892.00    |

```bash
mysql> INSERT INTO customers
    -> (first_name, last_name)
    -> VALUES ('Sarah', 'Vowell'), ('David', 'Sedaris'), ('Kojo', 'Nnamdi');
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0
```

```bash
mysql> SELECT * FROM customers;
+-------------+------------+-----------+
| customer_id | first_name | last_name |
+-------------+------------+-----------+
|           1 | Sarah      | Vowell    |
|           2 | David      | Sedaris   |
|           3 | Kojo       | Nnamdi    |
+-------------+------------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT first_name, last_name FROM customers;
+------------+-----------+
| first_name | last_name |
+------------+-----------+
| Sarah      | Vowell    |
| David      | Sedaris   |
| Kojo       | Nnamdi    |
+------------+-----------+
3 rows in set (0.01 sec)
```

```bash
mysql> INSERT INTO accounts
    -> (customer_id, balance)
    -> VALUES (1, 5460.23), (2, 909325.24), (3, 892.00);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0
```

```bash
mysql> SELECT * FROM accounts;
+------------+-------------+----------+-----------+
| account_id | customer_id | type     | balance   |
+------------+-------------+----------+-----------+
|          1 |           1 | Checking |   5460.23 |
|          2 |           2 | Checking | 909325.24 |
|          3 |           3 | Checking |    892.00 |
+------------+-------------+----------+-----------+
3 rows in set (0.00 sec)

mysql> SELECT customer_id, balance FROM accounts;
+-------------+-----------+
| customer_id | balance   |
+-------------+-----------+
|           1 |   5460.23 |
|           2 | 909325.24 |
|           3 |    892.00 |
+-------------+-----------+
3 rows in set (0.00 sec)
```