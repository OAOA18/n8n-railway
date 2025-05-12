# ────────────────────────────────
# n8n 1.92.2 — Railway edition
# ────────────────────────────────
FROM n8nio/n8n:1.92.2

# Optional utilities
RUN apk add --no-cache graphicsmagick tzdata

# Run as root (Railway’s default container UID)
USER root

# Persist data (workflows, creds, etc.)
WORKDIR /data

# Railway passes the port via $PORT
EXPOSE $PORT
ENV N8N_PORT=$PORT \
    N8N_USER_ID=root

CMD ["n8n", "start"]
