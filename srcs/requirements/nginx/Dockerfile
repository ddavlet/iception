# Use the Alpine base image for NGINX
FROM alpine

# Install OpenSSL to handle TLS
RUN apk update && apk add --no-cache nginx openssl

# Copy NGINX configuration file
COPY nginx.conf /etc/nginx/http.d/default.conf

# Create SSL sertificates
RUN mkdir -p /etc/ssl/certs \ && openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/certs/server.key -out /etc/ssl/certs/server.crt \
		-subj "/C=GE/ST=Berlin/L=Berlin/O=42Berlin/OU=Student/CN=ddavlety.42.fr"


# Copy SSL certificates
# COPY certs/server.crt /etc/ssl/certs/server.crt
# COPY certs/server.key /etc/ssl/private/server.key

# Expose port 443 for HTTPS
EXPOSE 443 80

# Start NGINX
CMD ["nginx", "-g", "daemon off;"]
