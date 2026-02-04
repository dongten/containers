# truongthanhoc-ui-base

This is a **production runtime image** for the truongthanhoc frontend (Next.js). It is designed to run the built application.

## Contents

- **Base Image**: `node:20-alpine`
- **Exposed Port**: `3000`
- **Working Directory**: `/app`

## Usage

### 1. Build the Image

```bash
docker build -t truongthanhoc-ui-base ./dev
```

### 2. Run the Application

This image assumes you have a built Next.js application. You typically use this image as a base for a final deployment image where you COPY the artifacts, or you mount the artifacts into it.

```bash
docker run --rm \
  -v $(pwd)/nextjs-dist:/app \
  -p 3000:3000 \
  -e NEXT_PUBLIC_DOMAIN_URL="https://example.com" \
  truongthanhoc-ui-base
```

### Environment Variables

| Variable | Description |
|----------|-------------|
| `NEXT_PUBLIC_DOMAIN_URL` | Public domain of the UI. |
| `NEXT_PUBLIC_API_URL` | URL of the backend API. |
| `PORT` | Application port (default: 3000). |
| `HOSTNAME` | Host binding (default: 0.0.0.0). |

The container executes `npm run start` by default.
