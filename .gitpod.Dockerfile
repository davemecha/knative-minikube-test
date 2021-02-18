FROM gitpod/workspace-full

USER gitpod

RUN sudo apt-get -q update
RUN bash -c ". .nvm/nvm.sh && nvm install v12 && nvm alias default v12"
RUN npm install -g yarn

RUN sudo apt-get -q update && sudo apt-get install -y apt-transport-https gnupg2 curl
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
#RUN sudo apt-get -q update 
#RUN sudo apt-get -q install -y kubectl

#RUN curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 && chmod +x minikube
#RUN sudo cp minikube /usr/local/bin && rm minikube

USER root