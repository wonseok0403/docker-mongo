docker build -t dockerwithmongo . 
docker run -d -p 27017:27017 dockerwithmongo 

docker exec -it dockerwithmongo /bin/bash
exit
