FROM alpine:latest

RUN apk add --no-cache terraform

CMD ["terraform", "--version"]