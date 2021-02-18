FROM gitpod/workspace-full

USER gitpod

# dev tools
RUN sudo apt-get -q update
RUN bash -c ". .nvm/nvm.sh && nvm install v12 && nvm alias default v12"
RUN npm install -g yarn

# kubectl
RUN sudo apt-get -q update && sudo apt-get install -y apt-transport-https gnupg2 curl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN sudo apt-get -q update 
RUN sudo apt-get -q install -y kubectl

# minikube
RUN sudo apt-get update -y
RUN sudo apt-get install -y conntrack
RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
RUN sudo cp minikube /usr/local/bin && rm minikube

# kind
RUN curl -Lo kind https://github.com/kubernetes-sigs/kind/releases/download/v0.7.0/kind-$(uname)-amd64
RUN chmod +x kind
RUN sudo mv kind /usr/local/bin

USER root