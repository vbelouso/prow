# syntax=docker/dockerfile:1
FROM registry.access.redhat.com/ubi9/go-toolset:1.20.10-2.1699551725
USER 0
COPY go.mod ./
RUN go mod download
COPY *.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -o /docker-gs-ping
RUN chown 1001:1001 /docker-gs-ping
USER 1001
CMD ["tail -f /dev/null"]
