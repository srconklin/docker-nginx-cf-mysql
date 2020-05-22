FROM mcr.microsoft.com/mssql/server:2019-latest

# Copy initialization scripts
COPY . .

USER root

# Grant permissions for the run-initialization script to be executable
RUN chmod +x run-initialization.sh

ENV ACCEPT_EULA=Y
ENV sa_password=Pri234Sc!

# Run Microsoft SQl Server and initialization script (at the same time)
# Note: If you want to start MsSQL only (without initialization script) you can comment bellow line out, CMD entry from base image will be taken
# CMD /bin/bash ./entrypoint.sh $sa_password
# ENTRYPOINT ["/entrypoint.sh"]
CMD ["sh", "-c", "./entrypoint.sh  ${sa_password}"]
#CMD ["echo", "${sa_password}"]