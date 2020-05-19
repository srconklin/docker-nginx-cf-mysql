FROM mcr.microsoft.com/mssql/server:2019-latest

# Copy initialization scripts
COPY . .

ENV ACCEPT_EULA=Y
ENV sa_password=Pri234Sc

# Run Microsoft SQl Server and initialization script (at the same time)
# Note: If you want to start MsSQL only (without initialization script) you can comment bellow line out, CMD entry from base image will be taken
CMD /bin/bash ./entrypoint.sh

