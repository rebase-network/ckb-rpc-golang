flags=-X main.gitHash=`git rev-parse --short HEAD` -X main.buildDate=`date -u '+%Y-%m-%d'`

build:
	go build -ldflags "$(flags)" -o ckb-rpc rpc.go

build-all:
	GOARCH=amd64 GOOS=darwin  go build -ldflags "$(flags) -w -s" -o ckb-rpc-mac rpc.go
	GOARCH=amd64 GOOS=linux   go build -ldflags "$(flags) -w -s" -o ckb-rpc-linux rpc.go

shasum:
	shasum -a 256 ckb-rpc-linux ckb-rpc-mac