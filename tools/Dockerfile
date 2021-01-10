FROM python:3

#FIXME : bad format/URL for kubernetes galaxy? 
RUN python3 -m pip install tox ansible openshift jmespath && \
      ansible-galaxy collection install community.crypto && \
      ansible-galaxy collection install git+https://github.com/ansible-collections/community.kubernetes.git

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.20.0/bin/linux/amd64/kubectl && \
      chmod +x kubectl && mv kubectl /usr/bin

COPY . /opt/molecule_kubevirt
