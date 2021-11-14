docker rm $(docker ps -a -q) --force
docker build -t apisploit .
docker run -dit -p 8000:8000 --name testapisploit apisploit
docker exec -it testapisploit bash