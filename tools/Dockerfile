FROM python:3

#FIXME : bad format/URL for kubernetes galaxy? 
RUN python3 -m pip install tox ansible openshift jmespath && \
      ansible-galaxy collection install community.crypto && \
      ansible-galaxy collection install git+https://github.com/ansible-collections/community.kubernetes.git

COPY . /opt/molecule_kubevirt
