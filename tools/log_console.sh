#!/bin/bash
# Backgroung wait for Pod reflecting VM to be reday then log console
until kubectl wait --for=condition=Ready pod -l kubevirt.io=virt-launcher --namespace default;
  do echo "Still Waiting VM Instance Pod to start..."; sleep 5;
done

echo "Starting virtctl console" >> /tmp/virtcl.txt
sudo script -e -c "virtctl console instance" >> /tmp/virtcl.txt
