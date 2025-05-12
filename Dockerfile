FROM n8nio/n8n:1.92.2

# Install optional utilities
RUN apk add --no-cache graphicsmagick tzdata

# Set working directory for persistent data
WORKDIR /data

# Run as root (Railway defaults)
USER root

# Expose Railway’s assigned port
ENV N8N_PORT=${PORT} \
    N8N_USER_ID=root

EXPOSE ${PORT}

# Start n8n
CMD ["n8n", "start"]
