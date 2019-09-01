FROM node:8.9.4
RUN mkdir /root/packer
WORKDIR /root/packer
RUN wget https://releases.hashicorp.com/packer/1.1.3/packer_1.1.3_linux_amd64.zip
RUN wget https://releases.hashicorp.com/terraform/0.11.1/terraform_0.11.1_linux_amd64.zip
RUN apt-get update
RUN apt-get install unzip -y
RUN unzip packer_1.1.3_linux_amd64.zip
RUN unzip terraform_0.11.1_linux_amd64.zip
RUN mv packer /usr/local/bin/packer
RUN mv terraform /usr/local/bin/terraform
RUN rm packer_1.1.3_linux_amd64.zip
RUN rm terraform_0.11.1_linux_amd64.zip
FROM python:3
WORKDIR /usr/src/app
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt
CMD [ "python", "./your-daemon-or-script.py" ]
# Install Ansible.
RUN pip install ansible
# Define working directory.
WORKDIR /data
# Define default command.
CMD ["bash"]
RUN make all
RUN make install
