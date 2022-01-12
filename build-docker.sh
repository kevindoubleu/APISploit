docker rm $(docker ps -a -q) --force
if test -z "$(docker images -q apisploit:latest)"; then
    docker build -t apisploit .
fi
docker run -dit -p 8000:8000 --name testapisploit apisploit
docker exec -it testapisploit bash