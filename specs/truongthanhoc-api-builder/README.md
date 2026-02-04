# truongthanhoc-api-builder

This is a **builder image** for the truongthanhoc API (Strapi). It is responsible for installing dependencies (including production-only options) and running the Strapi build command.

## Contents

- **Base Image**: `node:20-alpine`
- **System Dependencies**: Includes `build-base`, `python3`, `vips-dev` etc., needed for compiling native Node modules like `sharp`.
- **Scripts**: `run.sh` to orchestrate the build.

## Usage

### 1. Build the Builder Image

```bash
docker build -t truongthanhoc-api-builder ./dev
```

### 2. Run the Builder

Mount your source code to `/src` and an output directory to `/dist`.

```bash
docker run --rm \
  -v $(pwd)/strapi-source:/src \
  -v $(pwd)/strapi-dist:/dist \
  truongthanhoc-api-builder
```

### How it Works

1. **Source**: Code is copied from `/src` to a temporary build directory `/app`.
2. **Install**: Runs `npm install --only=production`. It also installs `node-gyp` globally to handle native addons.
3. **Build**: Runs `npm run build` (Strapi build).
4. **Output**: Copies the fully built application (including `node_modules` and build artifacts) to `/dist`.
