FROM ubuntu:jammy
LABEL org.opencontainers.image.source https://github.com/kaio6fellipe/terraform-devops

ENV DEBIAN_FRONTEND noninteractive
ENV AWS_CLI_VERSION=2.11.9
ENV BOTO3_VERSION=1.26.114
ENV PYTEST_VERSION=7.3.1
ENV TESTFIXTURES_VERSION=7.1.0
ENV ANSIBLE_VERSION=7.4.0
ENV KUBECTL_VERSION=v1.26.0
ENV TERRAFORM_VERSION=1.2.4
ENV TFLINT_VERSION=v0.42.2
ENV TFSEC_VERSION=v1.28.1
ENV HELM_VERSION=v3.11.2
ENV K9S_VERSION=v0.26.7

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
      boto3==${BOTO3_VERSION} \
      pytest==${PYTEST_VERSION} \
      testfixtures==${TESTFIXTURES_VERSION}

RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
  unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
  rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
  chmod +x ./kubectl && \
  mv ./kubectl /usr/local/bin/kubectl

RUN curl "https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz" | tar -xzO linux-amd64/helm > /usr/local/bin/helm && \
  chmod +x /usr/local/bin/helm

COPY ./lib /lib

RUN chmod +x /lib/lint/install-tflint && ./lib/lint/install-tflint

RUN chmod +x /lib/lint/install-tfsec && ./lib/lint/install-tfsec

RUN curl -L https://awscli.amazonaws.com/awscli-exe-linux-x86_64-${AWS_CLI_VERSION}.zip -o awscli.zip && \
  unzip awscli.zip && \
  ./aws/install && \
  rm -f awscli.zip

RUN curl -fsSL "https://github.com/derailed/k9s/releases/download/${K9S_VERSION}/k9s_Linux_x86_64.tar.gz" | tar -xz --directory /usr/local/bin/

CMD ["/bin/sh", "-c", "tail -f /dev/null"]

WORKDIR /platform

RUN git config --system --add safe.directory /platform