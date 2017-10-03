FROM alpine:latest

RUN apk update
RUN apk add curl openssl ca-certificates

RUN curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
RUN ash get_helm.sh
RUN rm -rf get_helm.sh
RUN helm init --client-only

RUN curl https://dl.minio.io/client/mc/release/linux-amd64/mc > mc

RUN apk del curl

RUN chmod +x mc
RUN mv mc /bin
