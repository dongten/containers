# truongthanhoc-ui-builder

This is a Docker image designed to build Next.js frontend applications for the truongthanhoc project. It handles dependency installation and runs the Next.js production build process.

## Contents

- **Base Image**: `node:20-alpine`
- **Scripts**: Contains a `run.sh` script that manages the build process.

## Usage

### 1. Build the Docker Image

To build the builder image locally:

```bash
docker build ./dev -t truongthanhoc-ui-builder
```

### 2. Run the Builder

To use this image to build a Next.js project, mount your source code to `/src` and a directory for the build artifacts to `/dist`.

```bash
docker run --rm \
  -v $(pwd)/path/to/your/nextjs-app:/src \
  -v $(pwd)/output-dist:/dist \
  -e NEXT_PUBLIC_DOMAIN_URL="https://your-domain.com" \
  -e NEXT_PUBLIC_API_URL="https://api.your-domain.com" \
  truongthanhoc-ui-builder
```

### Environment Variables

The following environment variables can be configured during the build:

| Variable | Description | Default |
|----------|-------------|---------|
| `NEXT_PUBLIC_DOMAIN_URL` | The public URL of the frontend application. | `https://demo.sjjs.edu.vn` |
| `NEXT_PUBLIC_API_URL` | The URL of the backend API. | `https://api.sjjs.edu.vn` |
| `NODE_ENV` | Node environment. | `production` |

### How it Works

When the container runs:
1. It copies the source code from `/src` to the working directory (`/dist` inside the container).
2. Sets `fetch-retry-maxtimeout`.
3. Runs `npm install` to install dependencies.
4. Runs `next build` to generate the production build.
5. The built artifacts (including `node_modules` and `.next`) will be available in your mounted output directory.
