FROM golang:1.9.2-alpine3.7 as gcsfuse-builder

RUN apk add --update --no-cache git &&\
		go get -v github.com/googlecloudplatform/gcsfuse

FROM alpine:3.7

RUN apk add --update --no-cache fuse ca-certificates && rm -rf /tmp/*

COPY --from=gcsfuse-builder /go/bin/gcsfuse /usr/local/bin/

COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
