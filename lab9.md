# Lab 9 SELECT, UPDATE, INSERT Operations and SQL Functions

## MySQL with Docker

```bash
# Connect to MySQL in the docker container
$ docker-compose exec db bash
$ mysql -u root -p
```

```bash
# Backup MySQL database to a file
# There's no space between -p and [password]
# docker exec -it [ontainer_name_or_id] mysqldump -u[user] -p[password] [database_name] > backup.sql
$ docker exec -it csc350-php-mysql-labs-db-1 mysqldump -u root -prootpassword sitename > ./db/backup-lab9.sql
```

## Lab Task

Update Tables that you already made (in lab 8):

part 1 : In table "users"
- Update records  @simpson.com  email by @yahoo.com and order them decreasingly by the first name. 
- make all first name and last name records upper case
- Format registration_date to just show the date not time
- concatenate first name and last name and assign it a new column name such as full_name

Part 2: In table "accounts"
- update the balance of the second customer to $4400.00
- Insert 3 more data into your table (just use some random numbers for balance)
- Find the summation of all balances 
- count the number of users

```bash
# The users table is in the sitename database
mysql> USE sitename;
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> SHOW TABLES;
+--------------------+
| Tables_in_sitename |
+--------------------+
| accounts           |
| customers          |
| users              |
+--------------------+
3 rows in set (0.01 sec)
```

```bash
# Select all records from the users Table
mysql> SELECT * FROM users;
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
| user_id | first_name | last_name | email                | pass                                     | registration_date   |
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
|       1 | Jake       | Li        | jakeli@mail.com      | e727d1464ae12436e899a726da5b2f11d8381b26 | 2023-09-26 19:22:37 |
|       2 | Zoe        | Isabella  | email2@example.com   | 6b793ca1c216835ba85c1fbd1399ce729e34b4e5 | 2023-09-26 19:31:44 |
|       3 | John       | Lennon    | john@beatles.com     | 2a50435b0f512f60988db719106a258fb7e338ff | 2023-09-26 19:31:54 |
|       4 | Paul       | McCartney | paul@beatles.com     | 6ae16792c502a5b47da180ce8456e5ae7d65e262 | 2023-09-26 19:31:54 |
|       5 | George     | Harrison  | george@beatles.com   | 1af17e73721dbe0c40011b82ed4bb1a7dbe3ce29 | 2023-09-26 19:31:54 |
|       6 | Ringo      | Starr     | ringo@beatles.com    | 520f73691bcf89d508d923a2dbc8e6fa58efb522 | 2023-09-26 19:31:54 |
|       7 | David      | Jones     | davey@monkees.com    | ec23244e40137ef72763267f17ed6c7ebb2b019f | 2023-09-26 19:32:06 |
|       8 | Peter      | Tork      | peter@monkees.com    | b8f6bc0c646f68ec6f27653f8473ae4ae81fd302 | 2023-09-26 19:32:06 |
|       9 | Micky      | Dolenz    | micky@monkees.com    | 0599b6e3c9206ef135c83a921294ba6417dbc673 | 2023-09-26 19:32:06 |
|      10 | Mike       | Nesmith   | mike@monkees.com     | 804a1773e9985abeb1f2605e0cc22211cc58cb1b | 2023-09-26 19:32:06 |
|      11 | David      | Sedaris   | david@authors.com    | f54e748ae9624210402eeb2c15a9f506a110ef72 | 2023-09-26 19:32:06 |
|      12 | Nick       | Hornby    | nick@authors.com     | 815f12d7b9d7cd690d4781015c2a0a5b3ae207c0 | 2023-09-26 19:32:06 |
|      13 | Melissa    | Bank      | melissa@authors.com  | 15ac6793642add347cbf24b8884b97947f637091 | 2023-09-26 19:32:06 |
|      14 | Toni       | Morrison  | toni@authors.com     | ce3a79105879624f762c01ecb8abee7b31e67df5 | 2023-09-26 19:32:06 |
|      15 | Jonathan   | Franzen   | jonathan@authors.com | c969581a0a7d6f790f4b520225f34fd90a09c86f | 2023-09-26 19:32:06 |
|      16 | Don        | DeLillo   | don@authors.com      | 01a3ff9a11b328afd3e5affcba4cc9e539c4c455 | 2023-09-26 19:32:06 |
|      17 | Graham     | Greene    | graham@authors.com   | 7c16ec1fcbc8c3ec99790f25c310ef63febb1bb3 | 2023-09-26 19:32:06 |
|      18 | Michael    | Chabon    | michael@authors.com  | bd58cc413f97c33930778416a6dbd2d67720dc41 | 2023-09-26 19:32:06 |
|      19 | Richard    | Brautigan | richard@authors.com  | b1f8414005c218fb53b661f17b4f671bccecea3d | 2023-09-26 19:32:06 |
|      20 | Russell    | Banks     | russell@authors.com  | 6bc4056557e33f1e209870ab578ed362f8b3c1b8 | 2023-09-26 19:32:06 |
|      21 | Homer      | Simpson   | homer@simpson.com    | 54a0b2dcbc5a944907d29304405f0552344b3847 | 2023-09-26 19:32:06 |
|      22 | Marge      | Simpson   | marge@simpson.com    | cea9be7b57e183dea0e4cf000489fe073908c0ca | 2023-09-26 19:32:06 |
|      23 | Bart       | Simpson   | bart@simpson.com     | 73265774abd1028ed8ef06afc5fa0f9a7ccbb6aa | 2023-09-26 19:32:06 |
|      24 | Lisa       | Simpson   | lisa@simpson.com     | a09bb16971ec0759dfff75c088f004e205c9e27b | 2023-09-26 19:32:06 |
|      25 | Maggie     | Simpson   | maggie@simpson.com   | 0e87350b393ceced1d4751b828d18102be123edb | 2023-09-26 19:32:06 |
|      26 | Abe        | Simpson   | abe@simpson.com      | 6591827c8e3d4624e8fc1ee324f31fa389fdafb4 | 2023-09-26 19:32:06 |
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
26 rows in set (0.01 sec)
```

## Part 1

In table "users"
1. Update records  @simpson.com  email by @yahoo.com and order them decreasingly by the first name. 
2. make all first name and last name records upper case
3. 1.3 Format registration_date to just show the date not time
4. 1.4 concatenate first name and last name and assign it a new column name such as full_name

```bash
# Update records  @simpson.com  email by @yahoo.com
# REPLACE(column, 'old', 'new')
mysql> UPDATE users
    -> SET email = REPLACE(email, '@simpson.com', '@yahoo.com')
    -> WHERE email LIKE '%@simpson.com';
Query OK, 6 rows affected (0.03 sec)
Rows matched: 6  Changed: 6  Warnings: 0

# Another way to do it with CONCAT
# CONCAT is used to concatenate strings
mysql> UPDATE users
    -> SET email = CONCAT(SUBSTRING(email, 1, LOCATE('@', email)), 'yahoo.com')
    -> WHERE email LIKE '%@simpson.com';
```

```bash
# Order the users table decreasingly by the first name
mysql> SELECT * FROM users ORDER BY first_name DESC;
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
| user_id | first_name | last_name | email                | pass                                     | registration_date   |
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
|       2 | Zoe        | Isabella  | email2@example.com   | 6b793ca1c216835ba85c1fbd1399ce729e34b4e5 | 2023-09-26 19:31:44 |
|      14 | Toni       | Morrison  | toni@authors.com     | ce3a79105879624f762c01ecb8abee7b31e67df5 | 2023-09-26 19:32:06 |
|      20 | Russell    | Banks     | russell@authors.com  | 6bc4056557e33f1e209870ab578ed362f8b3c1b8 | 2023-09-26 19:32:06 |
|       6 | Ringo      | Starr     | ringo@beatles.com    | 520f73691bcf89d508d923a2dbc8e6fa58efb522 | 2023-09-26 19:31:54 |
|      19 | Richard    | Brautigan | richard@authors.com  | b1f8414005c218fb53b661f17b4f671bccecea3d | 2023-09-26 19:32:06 |
|       8 | Peter      | Tork      | peter@monkees.com    | b8f6bc0c646f68ec6f27653f8473ae4ae81fd302 | 2023-09-26 19:32:06 |
|       4 | Paul       | McCartney | paul@beatles.com     | 6ae16792c502a5b47da180ce8456e5ae7d65e262 | 2023-09-26 19:31:54 |
|      12 | Nick       | Hornby    | nick@authors.com     | 815f12d7b9d7cd690d4781015c2a0a5b3ae207c0 | 2023-09-26 19:32:06 |
|      10 | Mike       | Nesmith   | mike@monkees.com     | 804a1773e9985abeb1f2605e0cc22211cc58cb1b | 2023-09-26 19:32:06 |
|       9 | Micky      | Dolenz    | micky@monkees.com    | 0599b6e3c9206ef135c83a921294ba6417dbc673 | 2023-09-26 19:32:06 |
|      18 | Michael    | Chabon    | michael@authors.com  | bd58cc413f97c33930778416a6dbd2d67720dc41 | 2023-09-26 19:32:06 |
|      13 | Melissa    | Bank      | melissa@authors.com  | 15ac6793642add347cbf24b8884b97947f637091 | 2023-09-26 19:32:06 |
|      22 | Marge      | Simpson   | marge@yahoo.com      | cea9be7b57e183dea0e4cf000489fe073908c0ca | 2023-09-26 19:32:06 |
|      25 | Maggie     | Simpson   | maggie@yahoo.com     | 0e87350b393ceced1d4751b828d18102be123edb | 2023-09-26 19:32:06 |
|      24 | Lisa       | Simpson   | lisa@yahoo.com       | a09bb16971ec0759dfff75c088f004e205c9e27b | 2023-09-26 19:32:06 |
|      15 | Jonathan   | Franzen   | jonathan@authors.com | c969581a0a7d6f790f4b520225f34fd90a09c86f | 2023-09-26 19:32:06 |
|       3 | John       | Lennon    | john@beatles.com     | 2a50435b0f512f60988db719106a258fb7e338ff | 2023-09-26 19:31:54 |
|       1 | Jake       | Li        | jakeli@mail.com      | e727d1464ae12436e899a726da5b2f11d8381b26 | 2023-09-26 19:22:37 |
|      21 | Homer      | Simpson   | homer@yahoo.com      | 54a0b2dcbc5a944907d29304405f0552344b3847 | 2023-09-26 19:32:06 |
|      17 | Graham     | Greene    | graham@authors.com   | 7c16ec1fcbc8c3ec99790f25c310ef63febb1bb3 | 2023-09-26 19:32:06 |
|       5 | George     | Harrison  | george@beatles.com   | 1af17e73721dbe0c40011b82ed4bb1a7dbe3ce29 | 2023-09-26 19:31:54 |
|      16 | Don        | DeLillo   | don@authors.com      | 01a3ff9a11b328afd3e5affcba4cc9e539c4c455 | 2023-09-26 19:32:06 |
|      11 | David      | Sedaris   | david@authors.com    | f54e748ae9624210402eeb2c15a9f506a110ef72 | 2023-09-26 19:32:06 |
|       7 | David      | Jones     | davey@monkees.com    | ec23244e40137ef72763267f17ed6c7ebb2b019f | 2023-09-26 19:32:06 |
|      23 | Bart       | Simpson   | bart@yahoo.com       | 73265774abd1028ed8ef06afc5fa0f9a7ccbb6aa | 2023-09-26 19:32:06 |
|      26 | Abe        | Simpson   | abe@yahoo.com        | 6591827c8e3d4624e8fc1ee324f31fa389fdafb4 | 2023-09-26 19:32:06 |
+---------+------------+-----------+----------------------+------------------------------------------+---------------------+
26 rows in set (0.00 sec)
```

```bash
# make all first name and last name records upper case
mysql> UPDATE users SET first_name = UPPER(first_name), last_name = UPPER(last_name);
Query OK, 26 rows affected (0.02 sec)
Rows matched: 26  Changed: 26  Warnings: 0
```

```bash
# Format registration_date to just show the date not time
mysql> SELECT DATE(registration_date) as registration_date_only FROM users;
# Or:
mysql> SELECT user_id, first_name, last_name, email, pass, DATE(registration_date) FROM users;
+---------+------------+-----------+----------------------+------------------------------------------+-------------------------+
| user_id | first_name | last_name | email                | pass                                     | DATE(registration_date) |
+---------+------------+-----------+----------------------+------------------------------------------+-------------------------+
|       1 | JAKE       | LI        | jakeli@mail.com      | e727d1464ae12436e899a726da5b2f11d8381b26 | 2023-09-26              |
|       2 | ZOE        | ISABELLA  | email2@example.com   | 6b793ca1c216835ba85c1fbd1399ce729e34b4e5 | 2023-09-26              |
|       3 | JOHN       | LENNON    | john@beatles.com     | 2a50435b0f512f60988db719106a258fb7e338ff | 2023-09-26              |
|       4 | PAUL       | MCCARTNEY | paul@beatles.com     | 6ae16792c502a5b47da180ce8456e5ae7d65e262 | 2023-09-26              |
|       5 | GEORGE     | HARRISON  | george@beatles.com   | 1af17e73721dbe0c40011b82ed4bb1a7dbe3ce29 | 2023-09-26              |
|       6 | RINGO      | STARR     | ringo@beatles.com    | 520f73691bcf89d508d923a2dbc8e6fa58efb522 | 2023-09-26              |
|       7 | DAVID      | JONES     | davey@monkees.com    | ec23244e40137ef72763267f17ed6c7ebb2b019f | 2023-09-26              |
|       8 | PETER      | TORK      | peter@monkees.com    | b8f6bc0c646f68ec6f27653f8473ae4ae81fd302 | 2023-09-26              |
|       9 | MICKY      | DOLENZ    | micky@monkees.com    | 0599b6e3c9206ef135c83a921294ba6417dbc673 | 2023-09-26              |
|      10 | MIKE       | NESMITH   | mike@monkees.com     | 804a1773e9985abeb1f2605e0cc22211cc58cb1b | 2023-09-26              |
|      11 | DAVID      | SEDARIS   | david@authors.com    | f54e748ae9624210402eeb2c15a9f506a110ef72 | 2023-09-26              |
|      12 | NICK       | HORNBY    | nick@authors.com     | 815f12d7b9d7cd690d4781015c2a0a5b3ae207c0 | 2023-09-26              |
|      13 | MELISSA    | BANK      | melissa@authors.com  | 15ac6793642add347cbf24b8884b97947f637091 | 2023-09-26              |
|      14 | TONI       | MORRISON  | toni@authors.com     | ce3a79105879624f762c01ecb8abee7b31e67df5 | 2023-09-26              |
|      15 | JONATHAN   | FRANZEN   | jonathan@authors.com | c969581a0a7d6f790f4b520225f34fd90a09c86f | 2023-09-26              |
|      16 | DON        | DELILLO   | don@authors.com      | 01a3ff9a11b328afd3e5affcba4cc9e539c4c455 | 2023-09-26              |
|      17 | GRAHAM     | GREENE    | graham@authors.com   | 7c16ec1fcbc8c3ec99790f25c310ef63febb1bb3 | 2023-09-26              |
|      18 | MICHAEL    | CHABON    | michael@authors.com  | bd58cc413f97c33930778416a6dbd2d67720dc41 | 2023-09-26              |
|      19 | RICHARD    | BRAUTIGAN | richard@authors.com  | b1f8414005c218fb53b661f17b4f671bccecea3d | 2023-09-26              |
|      20 | RUSSELL    | BANKS     | russell@authors.com  | 6bc4056557e33f1e209870ab578ed362f8b3c1b8 | 2023-09-26              |
|      21 | HOMER      | SIMPSON   | homer@yahoo.com      | 54a0b2dcbc5a944907d29304405f0552344b3847 | 2023-09-26              |
|      22 | MARGE      | SIMPSON   | marge@yahoo.com      | cea9be7b57e183dea0e4cf000489fe073908c0ca | 2023-09-26              |
|      23 | BART       | SIMPSON   | bart@yahoo.com       | 73265774abd1028ed8ef06afc5fa0f9a7ccbb6aa | 2023-09-26              |
|      24 | LISA       | SIMPSON   | lisa@yahoo.com       | a09bb16971ec0759dfff75c088f004e205c9e27b | 2023-09-26              |
|      25 | MAGGIE     | SIMPSON   | maggie@yahoo.com     | 0e87350b393ceced1d4751b828d18102be123edb | 2023-09-26              |
|      26 | ABE        | SIMPSON   | abe@yahoo.com        | 6591827c8e3d4624e8fc1ee324f31fa389fdafb4 | 2023-09-26              |
+---------+------------+-----------+----------------------+------------------------------------------+-------------------------+
26 rows in set (0.02 sec)
```

```bash
# concatenate first name and last name and assign it a new column name such as full_name
mysql> SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM users;
+-------------------+
| full_name         |
+-------------------+
| JAKE LI           |
| ZOE ISABELLA      |
| JOHN LENNON       |
| PAUL MCCARTNEY    |
| GEORGE HARRISON   |
| RINGO STARR       |
| DAVID JONES       |
| PETER TORK        |
| MICKY DOLENZ      |
| MIKE NESMITH      |
| DAVID SEDARIS     |
| NICK HORNBY       |
| MELISSA BANK      |
| TONI MORRISON     |
| JONATHAN FRANZEN  |
| DON DELILLO       |
| GRAHAM GREENE     |
| MICHAEL CHABON    |
| RICHARD BRAUTIGAN |
| RUSSELL BANKS     |
| HOMER SIMPSON     |
| MARGE SIMPSON     |
| BART SIMPSON      |
| LISA SIMPSON      |
| MAGGIE SIMPSON    |
| ABE SIMPSON       |
+-------------------+
26 rows in set (0.00 sec)
```

## Part 2

In table "accounts"
1. update the balance of the second customer to $4400.00
2. Insert 3 more data into your table (just use some random numbers for balance)
3. Find the summation of all balances 
4. count the number of users

```bash
mysql> SELECT * FROM accounts;
+------------+-------------+----------+-----------+
| account_id | customer_id | type     | balance   |
+------------+-------------+----------+-----------+
|          1 |           1 | Checking |   5460.23 |
|          2 |           2 | Checking | 909325.24 |
|          3 |           3 | Checking |    892.00 |
+------------+-------------+----------+-----------+
3 rows in set (0.01 sec)
```

```bash
# update the balance of the second customer to $4400.00
mysql> UPDATE accounts SET balance = 4400.00 WHERE account_id = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0
```

```bash
# Insert 3 more data into your table (just use some random numbers for balance)
mysql> INSERT INTO accounts (customer_id, type, balance) VALUES (4, 'Checking', 1000.00);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO accounts (customer_id, type, balance) VALUES (5, 'Checking', 2000.00), (6, 'Checking', 3000.00);
Query OK, 2 rows affected (0.02 sec)
Records: 2  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM accounts;
+------------+-------------+----------+---------+
| account_id | customer_id | type     | balance |
+------------+-------------+----------+---------+
|          1 |           1 | Checking | 5460.23 |
|          2 |           2 | Checking | 4400.00 |
|          3 |           3 | Checking |  892.00 |
|          4 |           4 | Checking | 1000.00 |
|          5 |           5 | Checking | 2000.00 |
|          6 |           6 | Checking | 3000.00 |
+------------+-------------+----------+---------+
6 rows in set (0.00 sec)
```

```bash
# Find the summation of all balances
mysql> SELECT SUM(balance) FROM accounts;
+--------------+
| SUM(balance) |
+--------------+
|     16752.23 |
+--------------+
1 row in set (0.01 sec)
```

```bash
# count the number of users
mysql> SELECT COUNT(DISTINCT customer_id) FROM accounts;
+-----------------------------+
| COUNT(DISTINCT customer_id) |
+-----------------------------+
|                           6 |
+-----------------------------+
1 row in set (0.01 sec)
```
