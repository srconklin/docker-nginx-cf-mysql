#!/bin/bash
# Run Microsoft SQl Server and initialization script (at the same time)
echo "running db intialization...." 
echo $1
./run-initialization.sh $1 & /opt/mssql/bin/sqlservr 