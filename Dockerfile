# ───────────────────────────────────────────────────────────────
# n8n 1.92.2 for Railway
# ───────────────────────────────────────────────────────────────
FROM n8nio/n8n:1.92.2

# Optional utilities you asked for
RUN apk add --no-cache graphicsmagick tzdata

# Run n8n as root inside Railway’s container
USER root

# Railway sets $PORT automatically; expose it so health checks succeed
EXPOSE $PORT

# Persist workflows, credentials, etc.
WORKDIR /data

# n8n listens on the same $PORT Railway hands us
ENV N8N_PORT=$PORT \
    N8N_USER_ID=root

CMD ["n8n", "start"]
