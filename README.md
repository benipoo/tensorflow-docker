# Easiest path to start learning Tensorflow for machine learning using Ubuntu 20.04

In the interest of reliablity, I will be running a Jupyter Notebook server inside a Docker container, this is the way I currently develop my projects. It ensures a reproducible work environment because the Docker container isolates the Tensorflow installation from the local system. I use Jupyter Notebook because it provies an easy way to move files and view graphical outputs. For linux, Docker also provides the easiest way to utilize the GPU potential in Tensorflow, since a local installation of CUDA is not required.

## Minimal setup instructions:

Docker installation instructions:
https://docs.docker.com/get-docker/

Install NVIDIA drivers with CUDA capable GPU via your distros GUI

Nvidia Container Toolkit installation instructions:
https://github.com/NVIDIA/nvidia-docker/blob/master/README.md#quickstart

Check if gpu is available:

```console
$ lspci | grep -i nvidia
```

Verify your nvidia-docker installation:

```console
$ docker run --gpus all --rm nvidia/cuda nvidia-smi
```
Looking at the Dockerfile, we can see this build uses the existing tensorflow/tensorflow:latest-gpu-jupyter docker image provided by Tensorflow. My build just adds support for Python dependency imports from a requirements.txt file when building the image, making it easier to manage dependencies when working on a project.

Clone the project from Github and add the required dependencies for your projects as needed. I have added the mnist and gym packages for example. Open a terminal in the project directory and build the image from the Dockerfile when you have finished editing the requirements.txt file.

```console
$ docker build -t image_name .
```
Run the docker container and map your local directory and the containers directory to sync files in real time:

```console
$ sudo docker run \
	--name tf \
	--gpus all \
	-it \
	--rm \
	-p 8888:8888 \
	-p 6006:6006 \
	-v $(realpath ~/your/local/directory/for/notebookfiles):/tf/notebooks \
	image_name
```
