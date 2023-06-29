FROM debian AS build
WORKDIR /build
RUN curl https://github.com/FiloSottile/mkcert/releases/download/v1.4.4/mkcert-v1.4.4-linux-amd64 -o /build/mkcert


FROM scratch AS app
WORKDIR /app
COPY --from=build /build/mkcert /app/mkcert
RUN chmod +x /app/mkcert

ENTRYPOINT [ "/app/mkcert" ]