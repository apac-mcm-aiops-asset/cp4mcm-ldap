FROM quay.io/openshift/origin-cli:4.7

WORKDIR ~
RUN ls -la
RUN curl -L https://github.com/IBM/cloud-pak-cli/releases/download/v3.12.0/cloudctl-linux-amd64.tar.gz -o cloudctl.tar.gz
RUN tar -xzf cloudctl.tar.gz
RUN mv cloudctl-linux-amd64 cloudctl
COPY scripts scripts
COPY main.sh main.sh
RUN chmod +x main.sh && chmod +x ./scripts/CloudFormsandOIDC.sh && chmod +x ./scripts/ldap.sh && chmod +x ./scripts/mcm-postinstall.sh && chmod +x ./scripts/patch-im.sh && chmod +x ./scripts/lib/functions.sh

CMD ["./main.sh"]