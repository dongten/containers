# truongthanhoc-api-base

This is a **production base image** for the truongthanhoc API (Strapi). It is pre-configured with necessary system dependencies (build-base, vips, etc.) and environment variables required to run the Strapi backend.

## Contents

- **Base Image**: `node:20-alpine`
- **Dependencies**: `build-base`, `gcc`, `autoconf`, `automake`, `zlib-dev`, `libpng-dev`, `nasm`, `bash`, `vips-dev`, `git`.
- **Exposed Port**: `1337`
- **Working Directory**: `/app`

## Usage

### 1. Build the Image

```bash
docker build -t truongthanhoc-api-base ./dev
```

### 2. Run the Container

This image expects the application code (node_modules + built source) to be mounted or copied into `/app`.

```bash
docker run --rm \
  -v $(pwd)/my-strapi-app:/app \
  -p 1337:1337 \
  --env-file .env \
  truongthanhoc-api-base
```

### Environment Variables

This image supports a wide range of environment variables for configuring Strapi, Database, and Cloudinary.

| Variable | Description | Default |
|----------|-------------|---------|
| `NODE_ENV` | Node environment | `production` |
| `DATABASE_CLIENT` | Database client (e.g., postgres) | `postgres` |
| `DATABASE_HOST` | Database host | `localhost` |
| `DATABASE_PORT` | Database port | `5432` |
| `DATABASE_NAME` | Database name | `truongthanhoc_db` |
| `DATABASE_USERNAME` | Database username | `truongthanhoc_user` |
| `DATABASE_PASSWORD` | Database password | `truongthanhoc_pass` |
| `DATABASE_SSL` | Enable SSL for DB connection | `true` |
| `HOST` | Host binding | `0.0.0.0` |
| `PORT` | Service port | `1337` |

**Security Secrets (Required)**:
- `APP_KEYS`
- `API_TOKEN_SALT`
- `ADMIN_JWT_SECRET`
- `TRANSFER_TOKEN_SALT`
- `JWT_SECRET`

**Cloudinary Configuration**:
- `CLOUDINARY_NAME`
- `CLOUDINARY_KEY`
- `CLOUDINARY_SECRET`
