# Use the specified base image
FROM nvidia/cuda:12.0.1-cudnn8-runtime-ubuntu22.04

# Set the working directory
WORKDIR /app

# Copy requirements file
COPY . .

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Install the requirements
RUN pip3 install --no-cache-dir -r /app/demo/requirements.dev.txt

