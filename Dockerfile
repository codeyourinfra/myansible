FROM python:3.9.2-alpine3.13

COPY requirements.txt .
RUN apk --no-cache add cargo curl gcc git libffi-dev libxml2-dev libxslt-dev make musl-dev openssh openssh-keygen openssl-dev \
    && curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py -s \
    && python get-pip.py && rm get-pip.py \
    && pip install --no-cache-dir -r requirements.txt -r https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt