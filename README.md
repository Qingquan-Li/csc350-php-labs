# CSC 350 - PHP - MySQL - Labs

## Run Docker

```bash
# Start Docker (build and run the docker container)
$ docker-compose up -d

# Stop Docker (stop and remove the docker container)
$ docker-compose down
```

## Connect to MySQL in the command line (terminal)

```bash
# Connect to the docker container
$ docker-compose exec db bash
$ mysql -u root -p
```
