FROM alpine:latest as certs
RUN apk --update add ca-certificates

FROM scratch
COPY --from=certs /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY build/bin/authz /usr/local/bin/authz
ENTRYPOINT ["/usr/local/bin/authz"]
