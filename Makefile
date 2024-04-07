 ✔ Container mariadb    Created                                                                    0.2s 
 ✔ Container wordpress  Created                                                                    0.1s 
 ✔ Container nginx      Created                                                                    0.1s 
Attaching to mariadb, nginx, wordpress
mariadb    | mkdir: cannot create directory '/root/data/database': No such file or directory
wordpress  | mkdir: cannot create directory '/root/data/wordpress_files': No such file or directory
mariadb    | Starting MariaDB database server: mariadbd.
mariadb    | ERROR 1133 (28000) at line 5: Can't find any matching row in the user table
mariadb    | --------------
mariadb    | CREATE DATABASE IF NOT EXISTS db
mariadb    | --------------
mariadb    | 
mariadb    | --------------
mariadb    | CREATE USER IF NOT EXISTS 'hvercell'@'%' IDENTIFIED BY 'hvercell'
mariadb    | --------------
mariadb    | 
mariadb    | --------------
mariadb    | GRANT ALL PRIVILEGES ON db.* TO 'hvercell'@'%' IDENTIFIED BY 'hvercell'
mariadb    | --------------
mariadb    | 
mariadb    | --------------
mariadb    | GRANT ALL PRIVILEGES ON db.* TO 'boss'@'%' IDENTIFIED BY 'boss'
mariadb    | --------------
mariadb    | 
mariadb    | --------------
mariadb    | SET PASSWORD FOR 'boss'@'localhost' = PASSWORD('boss')
mariadb    | --------------
mariadb    | 
mariadb    | Stopping MariaDB database server: mariadbd.
mariadb    | 240407 17:09:41 mysqld_safe Logging to syslog.
mariadb    | 240407 17:09:41 mysqld_safe Starting mariadbd daemon with databases from /var/lib/mysql
wordpress  | Error: WordPress files seem to already be present here.
wordpress  | Error: One or more database tables are unavailable. The database may need to be repaired.
wordpress  | Error: One or more database tables are unavailable. The database may need to be repaired.
wordpress  | Error: Error establishing a database connection.
wordpress  | Error: Error establishing a database connection.
wordpress  | Error: Error establishing a database connection.

Error with docker compose