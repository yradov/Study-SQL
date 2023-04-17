# README #

## DOCKER
### CREATE DB IMAGE
- docker build -t mysql-db-study .
- docker run --rm -p 9090:80 mysql-db-study

- docker-compose up 
- docker-compose down


## USAGE
- http://localhost:8081/ - phpMyAdmin url
- To connect external clients to MySql, use port 3307
- docker exec -it mysql-db-study sh - enter to the container with DB
