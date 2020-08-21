#!/usr/bin/env bash
echo "::::::::::update operating system::::::::::"
sudo apt-get update

echo "::::::::::Docker dependencies::::::::::"
sudo apt-get install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

echo "::::::::::curl command::::::::::"
sudo apt-get install -y curl

echo "::::::::::downloading an add-key for Kubernetes from URL::::::::::"
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add

echo "::::::::::add important dependencies for kubernetes::::::::::"
sudo chmod 777 /etc/apt/sources.list.d/

echo "::::::::::adding file::::::::::"
sudo cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

echo "::::::::::update::::::::::"
sudo apt-get update

echo "::::::::::Installing kubeadm, kubelet and kubectl::::::::::"
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni

sudo swapoff -a

