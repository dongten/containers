FROM node:16-alpine

# Install build dependencies
# RUN apk add --no-cache python3 make g++

WORKDIR /src

COPY build.sh .
RUN chmod +x build.sh

# Expose port
EXPOSE 4400

# Default command (can be overridden in docker-compose)
CMD ["./build.sh", "/src", "/dist"]