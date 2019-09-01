FROM ubuntu
# Install Python.
RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv && \
  rm -rf /var/lib/apt/lists/*
# Install ansible
RUN pip install ansible
# Define working directory.
WORKDIR /data
# Define default command.
CMD ["bash"]
