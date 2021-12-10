 
#!/bin/bash

docker pull benipoo/jupyter:latest

sudo docker run \
	--name tf \
	--gpus all \
	-it \
	--rm \
	-p 8888:8888 \
	-p 6006:6006 \
	-e JUPYTER_ENABLE_LAB=yes \
	-v /home/ben/active_projects/jupyter/notebooks/:/tf/notebooks \
	benipoo/jupyter

# execute command:
# cd /home/ben/active_projects/tensorflow/Jupyter/notebooks/
# sudo ./start.sh --allow-root
# -e JUPYTER_ENABLE_LAB=yes