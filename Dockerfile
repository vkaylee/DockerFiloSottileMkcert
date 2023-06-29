FROM curlimages/curl AS build
ARG MKCERT_VERSION
WORKDIR /build
RUN curl -L "https://github.com/FiloSottile/mkcert/releases/download/${MKCERT_VERSION}/mkcert-${MKCERT_VERSION}-linux-amd64" -o /build/mkcert
RUN chmod +x /build/mkcert

FROM scratch AS app
WORKDIR /app
COPY --from=build /build/mkcert /mkcert
# ROOT CA will be located on /.local/share/mkcert/rootCA.pem
# Change ROOT CA location by set CAROOT ENV
# By default all certificates will be located on working dir
ENTRYPOINT ["/mkcert"]