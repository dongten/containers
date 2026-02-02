# Contributing New Container Images

This repository uses a dynamic GitHub Action workflow to automatically build and publish container images found in the `specs/` directory.

## How to Add a New Image

To add a new container image, you simply need to create a directory structure that matches the desired image name and tag.

### 1. Directory Structure

The system scans for `Dockerfile`s at the following path depth:

```text
specs/<image-name>/<tag-name>/Dockerfile
```

### 2. Naming Convention

- **Image Name**: derived from the first subdirectory under `specs/`.
- **Tag**: derived from the second subdirectory.

### 3. Example

If you want to build an image named `my-service` with the tag `latest`:

1. Create the directory:
   ```bash
   mkdir -p specs/my-service/latest
   ```

2. Add your `Dockerfile` inside that directory:
   ```text
   specs/
   └── my-service/
       └── latest/
           ├── Dockerfile
           └── (other context files)
   ```

3. Commit and push to `main`.

### 4. Build Process

- The GitHub Action `Build and Publish Containers` will detect the new `Dockerfile`.
- It will build the image using `specs/my-service/latest` as the build context.
- It will publish the image to:
  `ghcr.io/<repository-owner>/my-service:latest`

### 5. Frequently Asked Questions

**Q: Can I have multiple tags for the same image?**
A: Yes, simply create sibling directories:
- `specs/my-service/v1/Dockerfile`
- `specs/my-service/v2/Dockerfile`

**Q: What if one build fails?**
A: The workflow runs in parallel. A failure in one image build will not affect the others.
