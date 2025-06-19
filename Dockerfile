# Use official lightweight PostgreSQL base image
FROM postgres:15-alpine

LABEL maintainer="yourname@example.com"

# Set default environment variables
ENV POSTGRES_DB=mytestdb \
    POSTGRES_USER=myuser \
    POSTGRES_PASSWORD=Test123

# Optional: Add initialization SQL script
COPY init.sql /docker-entrypoint-initdb.d/

# Expose PostgreSQL default port
EXPOSE 5432

# Healthcheck for PostgreSQL
HEALTHCHECK CMD pg_isready -U "$POSTGRES_USER"

