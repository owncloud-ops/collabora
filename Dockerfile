FROM amd64/debian:11-slim@sha256:83578646f4a0dd7d4eeac339562de64fb0d6700e85f48b7a83afb5df3886b38f

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>"
LABEL org.opencontainers.image.authors="ownCloud DevOps <devops@owncloud.com>"
LABEL org.opencontainers.image.title="Collabora"
LABEL org.opencontainers.image.url="https://github.com/owncloud-ops/collabora"
LABEL org.opencontainers.image.source="https://github.com/owncloud-ops/collabora"
LABEL org.opencontainers.image.documentation="https://github.com/owncloud-ops/collabora"

ARG COLLABORA_TOKEN
ARG BUILD_VERSION
ARG GOMPLATE_VERSION
ARG CONTAINER_LIBRARY_VERSION

# renovate: datasource=github-releases depName=hairyhenderson/gomplate
ENV GOMPLATE_VERSION="${GOMPLATE_VERSION:-v3.11.3}"
# renovate: datasource=docker depName=collabora/code
ENV COLLABORA_RAW_VERSION="${BUILD_VERSION:-22.05.5.4.1}"
# renovate: datasource=github-releases depName=owncloud-ops/container-library
ENV CONTAINER_LIBRARY_VERSION="${CONTAINER_LIBRARY_VERSION:-v0.1.0}"

ENV LC_CTYPE=C.UTF-8

ADD overlay /
WORKDIR /opt/cool

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget curl gnupg2 apt-transport-https ca-certificates fonts-open-sans openssh-client && \
    curl -SsfL -o /usr/local/bin/gomplate "https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64" && \
    curl -SsfL "https://github.com/owncloud-ops/container-library/releases/download/${CONTAINER_LIBRARY_VERSION}/container-library.tar.gz" | tar xz -C / && \
    chmod 755 /usr/local/bin/gomplate && \
    COLLABORA_VERSION=$(echo "$COLLABORA_RAW_VERSION" | cut -d '.' -f 1,2) && \
    echo "Setup Collabora 'v$COLLABORA_VERSION'" && \
    curl -SsfL -o /usr/share/keyrings/collaboraonline-release-keyring.gpg https://collaboraoffice.com/downloads/gpg/collaboraonline-release-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/collaboraonline-release-keyring.gpg] https://www.collaboraoffice.com/repos/CollaboraOnline/${COLLABORA_VERSION}/customer-debian11-${COLLABORA_TOKEN} /" | tee "/etc/apt/sources.list.d/collabora.list" && \
    apt-get update && \
    apt-get -y install locales-all coolwsd collabora-online-brand collaboraoffice-dict* \
      collaboraofficebasis-ar collaboraofficebasis-as collaboraofficebasis-ast \
      collaboraofficebasis-bg collaboraofficebasis-bn-in \
      collaboraofficebasis-br collaboraofficebasis-ca \
      collaboraofficebasis-calc collaboraofficebasis-ca-valencia \
      collaboraofficebasis-core collaboraofficebasis-cs \
      collaboraofficebasis-cy collaboraofficebasis-da \
      collaboraofficebasis-de collaboraofficebasis-draw \
      collaboraofficebasis-el collaboraofficebasis-en-gb \
      collaboraofficebasis-en-us collaboraofficebasis-es \
      collaboraofficebasis-et collaboraofficebasis-eu \
      collaboraofficebasis-extension-pdf-import collaboraofficebasis-fi \
      collaboraofficebasis-fr collaboraofficebasis-ga \
      collaboraofficebasis-gd collaboraofficebasis-gl \
      collaboraofficebasis-graphicfilter collaboraofficebasis-gu \
      collaboraofficebasis-he collaboraofficebasis-hi \
      collaboraofficebasis-hr collaboraofficebasis-hu \
      collaboraofficebasis-id collaboraofficebasis-images \
      collaboraofficebasis-impress collaboraofficebasis-is \
      collaboraofficebasis-it collaboraofficebasis-ja \
      collaboraofficebasis-km collaboraofficebasis-kn \
      collaboraofficebasis-ko collaboraofficebasis-lt \
      collaboraofficebasis-lv collaboraofficebasis-ml \
      collaboraofficebasis-mr collaboraofficebasis-nb \
      collaboraofficebasis-nl collaboraofficebasis-nn \
      collaboraofficebasis-oc collaboraofficebasis-ooofonts \
      collaboraofficebasis-ooolinguistic collaboraofficebasis-or \
      collaboraofficebasis-pa-in collaboraofficebasis-pl \
      collaboraofficebasis-pt collaboraofficebasis-pt-br \
      collaboraofficebasis-ro collaboraofficebasis-ru \
      collaboraofficebasis-sk collaboraofficebasis-sl \
      collaboraofficebasis-sr collaboraofficebasis-sr-latn \
      collaboraofficebasis-sv collaboraofficebasis-ta \
      collaboraofficebasis-te collaboraofficebasis-tr \
      collaboraofficebasis-uk collaboraofficebasis-vi \
      collaboraofficebasis-writer collaboraofficebasis-zh-cn \
      collaboraofficebasis-zh-tw && \
    chown cool:cool /opt/cool/systemplate/etc/hosts /opt/cool/systemplate/etc/resolv.conf && \
    chown cool:cool /etc/coolwsd && \
    rm -rf /etc/coolwsd/proof_key* && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

EXPOSE 9980

USER cool

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/usr/bin/collabora"]
