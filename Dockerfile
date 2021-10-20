FROM quay.io/openshift/origin-cli:4.7

WORKDIR ~
RUN ls -la
RUN curl -L https://github.com/IBM/cloud-pak-cli/releases/download/v3.12.0/cloudctl-linux-amd64.tar.gz -o cloudctl.tar.gz
RUN tar -xzf cloudctl.tar.gz
RUN mv cloudctl-linux-amd64 cloudctl
COPY scripts scripts
COPY main.sh main.sh
RUN chmod +x main.sh 

CMD ["./main.sh"]