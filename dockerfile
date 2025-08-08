FROM golang:1.22-alpine AS builder
WORKDIR /app
COPY . .
RUN go mod init github.com/nbagorija/sprint1212 && \  # Инициализация модуля
    go mod tidy && \                                # Загрузка зависимостей
    go build -o app                                 # Сборка

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/app /app/
COPY tracker.db /app/
CMD ["./app"]