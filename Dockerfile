FROM python:3.7.3-stretch

# Maintainer info
LABEL maintainer="sj.nandita@gmail.com"

# Make working directories
RUN  mkdir -p  /emotion-api
WORKDIR  /emotion-api

# Upgrade pip with no cache
RUN pip install --no-cache-dir -U pip

RUN python3 -m pip install --upgrade https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.12.0-py3-none-any.whl

# Copy application requirements file to the created working directory
COPY requirements.txt .

# Install application dependencies from the requirements file
RUN pip install -r requirements.txt

# Copy every file in the source folder to the created working directory
COPY  . .

# Run the python application
CMD ["python", "main.py"]