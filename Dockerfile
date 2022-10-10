FROM python:3.10.7-alpine3.16
LABEL maintainer "Gustavo Muniz do Carmo <gustavo@esign.com.br>"

RUN apk add --no-cache cargo curl gcc git libffi-dev libxml2-dev libxslt-dev musl-dev openssl-dev rust tar \
    && adduser -D ansible

USER ansible
WORKDIR /home/ansible
ENV PATH=/home/ansible/.local/bin:$PATH

COPY --chown=ansible requirements.txt .
RUN pip install --disable-pip-version-check --no-cache-dir --user ansible -r requirements.txt -r https://raw.githubusercontent.com/ansible-collections/azure/v1.13.0/requirements-azure.txt
