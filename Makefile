build:
	go build -ldflags "-w -s" -o ckb-rpc rpc.go

build-all:
	GOARCH=amd64 GOOS=darwin  go build -ldflags "-w -s" -o ckb-rpc-mac rpc.go
	GOARCH=amd64 GOOS=linux   go build -ldflags "-w -s" -o ckb-rpc-linux rpc.go

shasum:
	shasum -a 256 ckb-rpc-linux ckb-rpc-mac