 
FROM tensorflow/tensorflow:latest-gpu-jupyter

COPY requirements.txt /tmp/

RUN python3 -m pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt