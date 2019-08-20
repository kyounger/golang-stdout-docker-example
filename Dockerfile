FROM golang:1.10 AS builder
WORKDIR /app
COPY hello.go ./
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello-world .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /app/hello-world .
CMD ["./hello-world"]
