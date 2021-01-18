# README

### create containers
`docker-compose up`

###enter web container (for console, creating or running migrations, using generators, etc.
`docker exec -ti <container-name> /bin/bash`

### test the API
curl -d "activity[operation]=0" -d "activity[equipment_id]=376595269" http://localhost:3000/api/v1/activitie
