# Use the Alpine base image for NGINX
FROM alpine:3.20.2

# Install OpenSSL to handle TLS
RUN apk update && apk add --no-cache nginx openssl tini && \
	mkdir -p /etc/ssl/certs \ && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/certs/server.key -out /etc/ssl/certs/server.crt \
		-subj "/C=GE/ST=Berlin/L=Berlin/O=42Berlin/OU=Student/CN=ddavlety.42.fr" && \
	rm -rf /var/cache/apk/* && \
	mkdir -p /var/www/ddavlety/htdocs

ENTRYPOINT ["/sbin/tini", "--"]

# Copy NGINX configuration file
COPY nginx.conf /etc/nginx/http.d/default.conf

# COPY index.php /var/www/localhost/htdocs/

# Create SSL sertificates

# Copy SSL certificates
# COPY certs/server.crt /etc/ssl/certs/server.crt
# COPY certs/server.key /etc/ssl/private/server.key

# Expose port 443 for HTTPS
EXPOSE 443

HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
    CMD curl -f https://localhost || exit 1

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
