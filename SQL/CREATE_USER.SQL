mysql> CREATE USER 'daniel'@'%' IDENTIFIED BY 'P45sword';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'daniel'@'%' WITH GRANT OPTION;

mysql> CREATE USER 'daniel'@'localhost' IDENTIFIED BY 'P45sword';
mysql> GRANT ALL PRIVILEGES ON *.* TO 'daniel'@'localhost' WITH GRANT OPTION;

UPDATE mysql.user SET Password=PASSWORD('123') WHERE User='marcelo' AND Host='localhost';

FLUSH PRIVILEGES;