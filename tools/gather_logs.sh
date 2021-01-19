#!/bin/bash
# Kail sends any logs from default namespace
sudo kail -n default 2>&1 > tee /tmp/kail.log &

# Backgroung wait for Pod reflecting VM to be reday then log console
until kubectl wait --timeout=15m --for=condition=Ready pod -l kubevirt.io=virt-launcher --namespace default;
  do echo "Still Waiting Pod to start..."; sleep 5;
done

echo "Starting virtctl console" >> /tmp/virtcl.txt
sudo script -e -c "virtctl console instance" >> /tmp/virtcl.txt
sudo tail -f /tmp/virtcl.txt &
