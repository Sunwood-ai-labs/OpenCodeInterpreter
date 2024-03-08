
# Use the specified base image
FROM nvidia/cuda:12.0.1-cudnn8-runtime-ubuntu22.04

# Set the working directory
WORKDIR /app

# Copy requirements file
# COPY ./demo/requirements.txt /app/requirements.txt
COPY ./demo/requirements.dev.txt /app/requirements.txt

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Install the requirements
RUN pip3 install --no-cache-dir -r requirements.txt

# # Copy the rest of the application
# COPY . /app

# # Set the command to run the application
# CMD ["python3", "chatbot.py", "--path", "the model name of opencodeinterpreter model family e.g., m-a-p/0"]
