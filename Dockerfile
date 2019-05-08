FROM owncloud/ubuntu:latest

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>" \
  org.label-schema.name="Collabora" \
  org.label-schema.vendor="ownCloud GmbH" \
  org.label-schema.schema-version="1.0"

EXPOSE 9980

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/usr/bin/collabora"]

ARG COLLABORA_TOKEN

RUN apt-get update -y && \
  apt-get upgrade -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
  echo "deb https://www.collaboraoffice.com/repos/CollaboraOnline/4/customer-ubuntu1804-${COLLABORA_TOKEN}/ /" | tee /etc/apt/sources.list.d/collabora.list && \
  apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0C54D189F4BA284D && \
  apt-get update -y && \
  apt-get install -y locales-all loolwsd collabora-online-brand collaboraoffice6.0-dict* collaboraofficebasis6.0* && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /etc/apt/sources.list.d/collabora.list && \
  chgrp root /etc/loolwsd/loolwsd.xml /opt/lool/systemplate/etc/hosts /opt/lool/systemplate/etc/resolv.conf /var/cache/loolwsd && \
  chmod g+w /etc/loolwsd/loolwsd.xml /opt/lool/systemplate/etc/hosts /opt/lool/systemplate/etc/resolv.conf /var/cache/loolwsd

COPY rootfs /
WORKDIR /root
