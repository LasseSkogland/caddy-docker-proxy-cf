FROM docker.io/caddy:alpine

# TARGETARCH will be 'amd64' or 'arm64' depending on the platform being built
ARG TARGETARCH

EXPOSE 80 443 2019 443/udp
ENV XDG_CONFIG_HOME=/config
ENV XDG_DATA_HOME=/data

# Copy the pre-built binary from the host's bin folder
COPY bin/caddy-linux-${TARGETARCH} /usr/bin/caddy

# Ensure it has execution permissions
RUN chmod +x /usr/bin/caddy

CMD ["caddy", "docker-proxy"]
