# Base Image
FROM wnameless/oracle-xe-11g

# Create database_dump folder at / -location
RUN mkdir ../database_dumps 

# Copy the dump file and put it into database_dumps created earlier
COPY dump_file ../database_dumps

# Give permission to user oracle on oracle folder to create tablespace
and related operations

RUN chown -R oracle /u01/app/oracle/oradata/XE

# RUN the database initial sql.(create tablespace, create user etc)
ADD ../src/dbscripts/createDbUser.sql /docker-entrypoint-initdb.d/

# Here is where I want to call the impdp command. when a container is
created from this image.