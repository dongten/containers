FROM node:16-alpine

# Install build dependencies
# RUN apk add --no-cache python3 make g++

WORKDIR /app

# Copy package files
# COPY package*.json ./

# Install dependencies
# RUN npm install --legacy-peer-deps

# Copy application files
# COPY . .

# Expose port
EXPOSE 4400

# Default command (can be overridden in docker-compose)
CMD ["npm", "run", "start"]