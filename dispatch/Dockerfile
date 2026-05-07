# Stage 1 — Build the Go binary
FROM golang:1.21 AS builder

WORKDIR /opt/server

# Copy source code
COPY main.go .

# Build static binary
RUN go mod init dispatch && \
    go get github.com/opentracing/opentracing-go && \
    go get github.com/streadway/amqp && \
    go mod tidy && \
    CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -o dispatch main.go


# Stage 2 — Runtime image
FROM alpine:3.20

EXPOSE 8080

RUN addgroup -S roboshop && \
    adduser -S roboshop -G roboshop && \
    mkdir -p /opt/server && \
    chown -R roboshop:roboshop /opt/server

WORKDIR /opt/server

COPY --from=builder /opt/server/dispatch .

RUN chmod +x /opt/server/dispatch

USER roboshop

CMD ["/opt/server/dispatch"]