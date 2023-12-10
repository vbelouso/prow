# syntax=docker/dockerfile:1
FROM registry.redhat.io/rhel9/go-toolset@sha256:310fbbc9b2a6af87d730e244d5b20a1836df3ae295c290ffec2d4ef6a53a33f8
USER 0
COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
RUN chown 1001:1001 /docker-gs-ping
USER 1001
CMD ["tail -f /dev/null"]