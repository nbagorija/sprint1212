FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod tidy && \
    go build -o app

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app /app/
COPY tracker.db /app/
CMD ["./app"]
