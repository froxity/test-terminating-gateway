``` bash

# test go project directly
go run main.go

# compile go program
env GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o ./main ./main.go
# build image
docker build . -t test:0.0.0


# start consul
consul agent -dev -log-level DEBUG
# start nomad
sudo nomad agent -dev-connect -bind 0.0.0.0 -log-level DEBUG -config nomad-config/

# register external service
curl --request PUT --data @external.json localhost:8500/v1/catalog/register
consul config write external-defaults.hcl

# start terminating gateway
nomad run terminating.nomad
# stop terminating gateway
nomad stop -purge terminating

# start app
nomad run test.nomad
# stop app
nomad stop -purge test

```