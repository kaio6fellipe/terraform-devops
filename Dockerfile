FROM ubuntu:jammy
LABEL org.opencontainers.image.source https://github.com/kaio6fellipe/terraform-devops

ENV DEBIAN_FRONTEND noninteractive
ENV AWS_CLI_VERSION=2.11.9
ENV ANSIBLE_VERSION=7.4.0
ENV CHECKOV_VERSION=2.2.50
ENV KUBECTL_VERSION=v1.26.0
ENV TERRAFORM_VERSION=1.2.4
ENV TFLINT_VERSION=v0.42.2
ENV TFSEC_VERSION=v1.28.1

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update && apt-get install -y \
        apt-utils \
        curl \
        gettext-base \
        git \
        jq \
        lsof \
        python3 \
        python3-pip \ 
        tree \
        unzip \
        vim \
        zip 

RUN pip3 install --no-cache-dir \
      ansible==${ANSIBLE_VERSION} \
      checkov==${CHECKOV_VERSION} 

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
  rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

COPY ./hooks /hooks

RUN chmod +x /hooks/install_tflint.sh && ./hooks/install_tflint.sh

RUN chmod +x /hooks/install_tfsec.sh && ./hooks/install_tfsec.sh

RUN curl -L https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip -o awscli.zip && \
  unzip awscli.zip && \
  ./aws/install && \
  rm -f awscli.zip

CMD ["/bin/sh", "-c", "tail -f /dev/null"]

WORKDIR /platform

RUN git config --system --add safe.directory /platform