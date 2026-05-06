# Stage 1 — Build the Go binary
FROM golang:1.21 AS builder
WORKDIR /opt/server

# Copy source code
COPY main.go .

# Init module, get external dependencies, build
RUN go mod init dispatch && \
    go get github.com/opentracing/opentracing-go && \
    go get github.com/streadway/amqp && \
    go mod tidy && \
    go build -o dispatch main.go

# Stage 2 — Minimal runtime image
FROM alpine:3.20
EXPOSE 8080

# Create roboshop user
RUN addgroup -S roboshop && adduser -S roboshop -G roboshop && \
    mkdir /opt/server && \
    chown -R roboshop:roboshop /opt/server

WORKDIR /opt/server

# Copy only the compiled binary from builder
COPY --from=builder /opt/server/dispatch .

USER roboshop

CMD ["/opt/server/dispatch"]