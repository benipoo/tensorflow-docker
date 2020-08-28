
# Start with the image provided by Tensorflow
FROM tensorflow/tensorflow:latest-gpu-jupyter

# Copy the file in the same directory as this Dockerfile to the /tmp folder in the container
COPY requirements.txt /tmp/

# Ensure pip is updated
RUN python3 -m pip install --upgrade pip

# Install dependencies listed in the text file
RUN pip install -r /tmp/requirements.txt

