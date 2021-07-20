FROM debian:10-slim@sha256:a6bbc75c36b0d9d82ae4b64219b48c3027b7a101e9334b2ffb3bc71dbe94f552

LABEL maintainer="ownCloud DevOps <devops@owncloud.com>"
LABEL org.opencontainers.image.authors="ownCloud DevOps <devops@owncloud.com>"
LABEL org.opencontainers.image.title="Collabora"
LABEL org.opencontainers.image.url="https://github.com/owncloud-ops/collabora"
LABEL org.opencontainers.image.source="https://github.com/owncloud-ops/collabora"
LABEL org.opencontainers.image.documentation="https://github.com/owncloud-ops/collabora"

ARG COLLABORA_TOKEN
ARG BUILD_VERSION
ARG GOMPLATE_VERSION

# renovate: datasource=github-releases depName=hairyhenderson/gomplate
ENV GOMPLATE_VERSION="${GOMPLATE_VERSION:-v3.9.0}"
# renovate: datasource=docker depName=collabora/code versioning=loose
ENV COLLABORA_RAW_VERSION="${BUILD_VERSION:-6.4.10.5}"

ENV LC_CTYPE=C.UTF-8

ADD overlay /
WORKDIR /opt/lool

RUN export DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install -y wget curl gnupg2 apt-transport-https ca-certificates fonts-open-sans openssh-client && \
    curl -SsL -o /usr/local/bin/gomplate "https://github.com/hairyhenderson/gomplate/releases/download/${GOMPLATE_VERSION}/gomplate_linux-amd64-slim" && \
    chmod 755 /usr/local/bin/gomplate && \
    COLLABORA_VERSION=$(echo "$COLLABORA_RAW_VERSION" | cut -d '.' -f 1,2) && \
    echo "Setup Collabora 'v$COLLABORA_VERSION'" && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0C54D189F4BA284D && \
    echo "deb https://www.collaboraoffice.com/repos/CollaboraOnline/${COLLABORA_VERSION}/customer-debian10-${COLLABORA_TOKEN}/ /" | tee "/etc/apt/sources.list.d/collabora.list" && \
    apt-get update && \
    apt-get -y install locales-all loolwsd collabora-online-brand collaboraoffice${COLLABORA_VERSION}-dict* \
      collaboraofficebasis${COLLABORA_VERSION}-ar collaboraofficebasis${COLLABORA_VERSION}-as collaboraofficebasis${COLLABORA_VERSION}-ast \
      collaboraofficebasis${COLLABORA_VERSION}-bg collaboraofficebasis${COLLABORA_VERSION}-bn-in \
      collaboraofficebasis${COLLABORA_VERSION}-br collaboraofficebasis${COLLABORA_VERSION}-ca \
      collaboraofficebasis${COLLABORA_VERSION}-calc collaboraofficebasis${COLLABORA_VERSION}-ca-valencia \
      collaboraofficebasis${COLLABORA_VERSION}-core collaboraofficebasis${COLLABORA_VERSION}-cs \
      collaboraofficebasis${COLLABORA_VERSION}-cy collaboraofficebasis${COLLABORA_VERSION}-da \
      collaboraofficebasis${COLLABORA_VERSION}-de collaboraofficebasis${COLLABORA_VERSION}-draw \
      collaboraofficebasis${COLLABORA_VERSION}-el collaboraofficebasis${COLLABORA_VERSION}-en-gb \
      collaboraofficebasis${COLLABORA_VERSION}-en-us collaboraofficebasis${COLLABORA_VERSION}-es \
      collaboraofficebasis${COLLABORA_VERSION}-et collaboraofficebasis${COLLABORA_VERSION}-eu \
      collaboraofficebasis${COLLABORA_VERSION}-extension-pdf-import collaboraofficebasis${COLLABORA_VERSION}-fi \
      collaboraofficebasis${COLLABORA_VERSION}-fr collaboraofficebasis${COLLABORA_VERSION}-ga \
      collaboraofficebasis${COLLABORA_VERSION}-gd collaboraofficebasis${COLLABORA_VERSION}-gl \
      collaboraofficebasis${COLLABORA_VERSION}-graphicfilter collaboraofficebasis${COLLABORA_VERSION}-gu \
      collaboraofficebasis${COLLABORA_VERSION}-he collaboraofficebasis${COLLABORA_VERSION}-hi \
      collaboraofficebasis${COLLABORA_VERSION}-hr collaboraofficebasis${COLLABORA_VERSION}-hu \
      collaboraofficebasis${COLLABORA_VERSION}-id collaboraofficebasis${COLLABORA_VERSION}-images \
      collaboraofficebasis${COLLABORA_VERSION}-impress collaboraofficebasis${COLLABORA_VERSION}-is \
      collaboraofficebasis${COLLABORA_VERSION}-it collaboraofficebasis${COLLABORA_VERSION}-ja \
      collaboraofficebasis${COLLABORA_VERSION}-km collaboraofficebasis${COLLABORA_VERSION}-kn \
      collaboraofficebasis${COLLABORA_VERSION}-ko collaboraofficebasis${COLLABORA_VERSION}-lt \
      collaboraofficebasis${COLLABORA_VERSION}-lv collaboraofficebasis${COLLABORA_VERSION}-ml \
      collaboraofficebasis${COLLABORA_VERSION}-mr collaboraofficebasis${COLLABORA_VERSION}-nb \
      collaboraofficebasis${COLLABORA_VERSION}-nl collaboraofficebasis${COLLABORA_VERSION}-nn \
      collaboraofficebasis${COLLABORA_VERSION}-oc collaboraofficebasis${COLLABORA_VERSION}-ooofonts \
      collaboraofficebasis${COLLABORA_VERSION}-ooolinguistic collaboraofficebasis${COLLABORA_VERSION}-or \
      collaboraofficebasis${COLLABORA_VERSION}-pa-in collaboraofficebasis${COLLABORA_VERSION}-pl \
      collaboraofficebasis${COLLABORA_VERSION}-pt collaboraofficebasis${COLLABORA_VERSION}-pt-br \
      collaboraofficebasis${COLLABORA_VERSION}-ro collaboraofficebasis${COLLABORA_VERSION}-ru \
      collaboraofficebasis${COLLABORA_VERSION}-sk collaboraofficebasis${COLLABORA_VERSION}-sl \
      collaboraofficebasis${COLLABORA_VERSION}-sr collaboraofficebasis${COLLABORA_VERSION}-sr-latn \
      collaboraofficebasis${COLLABORA_VERSION}-sv collaboraofficebasis${COLLABORA_VERSION}-ta \
      collaboraofficebasis${COLLABORA_VERSION}-te collaboraofficebasis${COLLABORA_VERSION}-tr \
      collaboraofficebasis${COLLABORA_VERSION}-uk collaboraofficebasis${COLLABORA_VERSION}-vi \
      collaboraofficebasis${COLLABORA_VERSION}-writer collaboraofficebasis${COLLABORA_VERSION}-zh-cn \
      collaboraofficebasis${COLLABORA_VERSION}-zh-tw && \
    chown lool:lool /opt/lool/systemplate/etc/hosts /opt/lool/systemplate/etc/resolv.conf && \
    chown lool:lool /etc/loolwsd && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/*

EXPOSE 9980

USER lool

ENTRYPOINT ["/usr/bin/entrypoint"]
CMD ["/usr/bin/collabora"]
