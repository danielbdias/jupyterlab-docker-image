# jupyterlab-docker-image

The main idea of this repository is to provide a base image to use Jupyter Lab running in Ubuntu with Python 3.

To start a container with this image you can use the `docker-compose.yml` file as base, which installs some libs in python to use in Jupyter Lab (like `pandas`, `matplotlib` and `numpy`) and starts Jupyter Lab in port 9000.

This image is published in Docker Hub in: https://hub.docker.com/r/danielbdias/jupyterlab/
