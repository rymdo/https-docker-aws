FROM debian:buster

WORKDIR /root

# Install General Dependencies
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget unzip git && \
    rm -rf /var/lib/apt/lists/*

# Install Hashicorp Packer
ENV PACKER_VERSION=1.6.0
RUN wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip && \
    rm -Rf packer_${PACKER_VERSION}_linux_amd64.zip && \
    mv packer /usr/local/sbin/ && \
    packer --version

# Install AWS CLI
RUN wget -q https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip && \ 
    unzip -q awscli-exe-linux-x86_64.zip && \ 
    rm -Rf awscli-exe-linux-x86_64.zip && \
    ./aws/install && \ 
    rm -Rf ./aws && \
    aws --version
