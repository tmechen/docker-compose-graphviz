FROM golang:alpine AS builder

COPY . /go/src/github.com/tmechen/docker-compose-graphviz
RUN GOOS=linux GOARCH=amd64 && apk add --no-cache g++ git glide && \
    cd /go/src/github.com/tmechen/docker-compose-graphviz && \
    glide install && \
    go build -ldflags "-linkmode external" -a docker-compose-graphviz.go

FROM alpine

COPY --from=builder /go/src/github.com/tmechen/docker-compose-graphviz/docker-compose-graphviz /docker-compose-graphviz
RUN apk add --no-cache graphviz ttf-freefont
VOLUME [ "/data" ]
WORKDIR /data
CMD ["/bin/sh", "-c", "/docker-compose-graphviz | dot -oout.png -Tpng" ]
