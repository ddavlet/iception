# Use the Alpine base image for NGINX
FROM alpine:3.20.2

# Install OpenSSL to handle TLS
RUN apk update && apk add --no-cache nginx openssl tini && \
	mkdir -p /var/www/

ENTRYPOINT ["/sbin/tini", "--"]

# Copy NGINX configuration file
COPY nginx.conf /etc/nginx/http.d/default.conf
COPY index.html /var/www/
COPY features.html /var/www/
COPY styles.css /var/www/
# Expose port 443 for HTTPS
EXPOSE 4000

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f http://localhost:4000 || exit 1

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
