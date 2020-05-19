docker system prune -f
docker container prune -f
docker image prune -f -a
docker volume prune -f 
docker network prune -f

docker image ls