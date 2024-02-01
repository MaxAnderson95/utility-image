[![ci](https://github.com/MaxAnderson95/utility-image/actions/workflows/build.yaml/badge.svg)](https://github.com/MaxAnderson95/utility-image/actions/workflows/build.yaml)

# Utility Container Image

This is a container image I use for testing and debugging. It includes all of my most used utilities.

Notably it includes `pkgx` which allows me to quickly install and run cli utilities at runtime. It also includes `http-server` which can be used to quickly create an HTTP server from within the container.

## Usage

With Docker:

```bash
docker run -it ghcr.io/maxanderson95/utility-image:latest
```

With Kubernetes:

```bash
kubectl run -it --rm utility-pod --image=ghcr.io/maxanderson95/utility-image:latest
```
