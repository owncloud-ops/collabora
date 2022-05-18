# collabora

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-ops/collabora/status.svg)](https://drone.owncloud.com/owncloud-ops/collabora)
[![Docker Hub](https://img.shields.io/badge/docker-latest-blue.svg?logo=docker&logoColor=white)](https://hub.docker.com/r/owncloudops/collabora)

Custom container image for [Collabora Online](https://www.collaboraoffice.com/de/collabora-online/).

## Versioning

The used version tags are representing the minor upstream versions. The patch release number is continuously increased by us and don't reflect the full upstream release directly. Example: `v21.11.5` means the image contains Collabora `v21.11` but **not** necessarily Collabora `v21.11.5`.

## Environment Variables

```Shell
COLLABORA_ADMIN_CONSOLE_ENABLE=true
COLLABORA_ADMIN_CONSOLE_ENABLE_PAM=false
COLLABORA_ADMIN_CONSOLE_PASSWORD=
COLLABORA_ADMIN_CONSOLE_USERNAME=
COLLABORA_ALLOWED_LANGUAGES="de_DE en_GB en_US es_ES fr_FR it nl pt_BR pt_PT ru"
COLLABORA_LOGGING_ANONYMIZE_USER_DATA=false
COLLABORA_LOGGING_COLOR=true
COLLABORA_LOGGING_LEVEL=warning
COLLABORA_NET_LISTEN=any
COLLABORA_NET_POST_ALLOW=true
COLLABORA_NET_POST_ALLOW_HOSTS="127.0.0.1 ::1"
COLLABORA_NET_PROTO=all
COLLABORA_NUM_RESPAWN_CHILDREN=1
COLLABORA_PER_DOCUMENT_AUTOSAVE_DURATION=300
COLLABORA_PER_DOCUMENT_IDLESAVE_DURATION=30
COLLABORA_PER_DOCUMENT_IDLE_TIMEOUT=3600
COLLABORA_PER_DOCUMENT_LIMIT_FILE_SIZE=0
COLLABORA_PER_DOCUMENT_LIMIT_NUM_OPEN_FILES=0
COLLABORA_PER_DOCUMENT_MAX_CONCURRENCY=4
COLLABORA_PER_DOCUMENT_REDLINING_AS_COMMENT=true
COLLABORA_PER_VIEW_IDLE_TIMEOUT=900
COLLABORA_PER_VIEW_OUT_OF_FOCUS_TIMEOUT=120
COLLABORA_SECURITY_CAPABILITIES=true
COLLABORA_SECURITY_SECCOMP=true
COLLABORA_SERVER_NAME=
COLLABORA_STORAGE_WOPI_ALLOW=true
COLLABORA_STORAGE_WOPI_HOSTS_ALLOW="localhost"
COLLABORA_STORAGE_WOPI_MAX_FILE_SIZE=0
COLLABORA_TRACE_ENABLE=false
COLLABORA_TRACE_FILTER=
COLLABORA_SSL_ENABLE=false
COLLABORA_SSL_TERMINATION_ENABLE=true
```

## Ports

- 9980

## Build

You could use the `BUILD_VERSION` to specify the target version.

```Shell
docker build --build-arg BUILD_VERSION=21.11 -f Dockerfile -t collabora:latest .
```

## License

This project is licensed under the Apache 2.0 License - see the [LICENSE](https://github.com/owncloud-ops/collabora/blob/main/LICENSE) file for details.
