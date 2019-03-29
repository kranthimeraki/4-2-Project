#!/bin/bash
# this script is not compatible with dash shell; hence the above shebang is mandatory
# ------------------------------------------------------------------------- #
# This script shall create database and required users.
#INSTRUCTIONS: 
#1.This script executes as mysql root
#2.change dbname, pwd values respectively
#3.Depending on VM & mysql installtion edit the dbpath variable
#Scripts to be executed in the following order:
# 1.db_scripts_p1.sh script
# 2. create tables, foreign keys etc..
# 3.db_scripts_p2.sh script
# Created date       : 26-Jan-18
# Initial Author     : Sai
# ------------------------------------------------------------------------- #
# ---Variables to be modified at run time -------------------------------- #
dbname=atmospheredb
owner_user='root'
owner_pwd='passw0rd'
root_pwd='passw0rd'
dbpath="mysql -u root -e "
#dbpath="$mysql --host=127.0.0.1 -u root -p$root_pwd -e "

# ------------------------------------------------------------------------- #
# DONOT modify any content below this line at run time
# ------------------------------------------------------------------------- #
# creating databse steps
$dbpath"CREATE DATABASE $dbname ;"
# ------------------------------------------------------------------------- #
# creating OWNER user / grants steps
$dbpath"CREATE USER '$owner_user' IDENTIFIED BY '$owner_pwd' ;"
$dbpath"GRANT ALL ON $dbname.*  TO '$owner_user' WITH GRANT OPTION;"

#$dbpath "ALTER USER '$owner_user'@'localhost' IDENTIFIED WITH mysql_native_password BY '$owner_pwd';"