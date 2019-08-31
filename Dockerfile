FROM golang:alpine
MAINTAINER "HashiCorp Terraform Team <terraform@hashicorp.com>"
LABEL maintainer="HashiCorp Terraform Team <terraform@hashicorp.com>"
RUN apk add --update git bash openssh
