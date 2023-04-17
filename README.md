# README #

## DOCKER
### CREATE DB IMAGE
- docker build -t mysql-db-study .
- docker run --rm -p 9090:80 mysql-db-study

- docker-compose up --build
- docker-compose -f docker-compose-mysql.yml up 
- docker-compose up
- docker-compose down


## USES
- http://localhost:8081/ - phpMyAdmin url
- docker exec -it mysql-db-study sh - enter to the container
