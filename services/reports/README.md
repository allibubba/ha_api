# Docker Compose
stand all services up `docker-compose up`

build all services `docker-compose up --build`

exec into a container `docker-compose exec <container_name> /bin/bash`

# rails
for a new setup, install rails in the web_accounts container
`Rails new`

# phoenix
for a new setup, install phoenix in the web_reports container
install inside the container `mix phx.new . --module Report --database postgres --no-webpack`

