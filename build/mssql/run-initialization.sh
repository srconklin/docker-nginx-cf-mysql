#!/bin/bash
# Wait to be sure that SQL Server came up
echo "sleeping 30..."
sleep 30s

echo "creating db..."
# Run the setup script to create the DB and the schema in the DB
# Note: make sure that your password matches what is in the Dockerfile
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P $1 -d master -i create-database.sql