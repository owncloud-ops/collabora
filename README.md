# ownCloud: Collabora

[![Build Status](https://drone.owncloud.com/api/badges/owncloud-docker/collabora/status.svg)](https://drone.owncloud.com/owncloud-docker/collabora)
[![](https://images.microbadger.com/badges/image/owncloud/collabora.svg)](https://microbadger.com/images/owncloud/collabora "Get your own image badge on microbadger.com")

This is our official Collabora image used by ownCloud, it is built from our [Ubuntu container](https://registry.hub.docker.com/u/owncloud/ubuntu/).


## Versions

To get an overview about the available versions please take a look at the [GitHub branches](https://github.com/owncloud-docker/collabora/branches/all) or our [Docker Hub tags](https://hub.docker.com/r/owncloud/collabora/tags/), these lists are always up to date. Please note that release candidates or alpha/beta versions are only temporary available, they will be removed after the final release of a version.


## Volumes

* None


## Ports

* 9980


## Available environment variables

```
COLLABORA_ADMIN_CONSOLE_ENABLE true
COLLABORA_ADMIN_CONSOLE_ENABLE_PAM false
COLLABORA_ADMIN_CONSOLE_PASSWORD
COLLABORA_ADMIN_CONSOLE_USERNAME
COLLABORA_ALLOWED_LANGUAGES de_DE en_GB en_US es_ES fr_FR it nl pt_BR pt_PT ru
COLLABORA_CHILD_ROOT_PATH /opt/lool/child-roots
COLLABORA_ENTRYPOINT_INITIALIZED true
COLLABORA_FILE_SERVER_ROOT_PATH /usr/share/loolwsd
COLLABORA_LOGGING_ANONYMIZE_FILENAMES false
COLLABORA_LOGGING_ANONYMIZE_USERNAMES false
COLLABORA_LOGGING_COLOR true
COLLABORA_LOGGING_FILE_ARCHIVE timestamp
COLLABORA_LOGGING_FILE_COMPRESS true
COLLABORA_LOGGING_FILE_ENABLE false
COLLABORA_LOGGING_FILE_FLUSH false
COLLABORA_LOGGING_FILE_PATH /var/log/loolwsd.log
COLLABORA_LOGGING_FILE_PURGE_AGE 10 days
COLLABORA_LOGGING_FILE_PURGE_COUNT 10
COLLABORA_LOGGING_FILE_ROTATE_ON_OPEN true
COLLABORA_LOGGING_FILE_ROTATION never
COLLABORA_LOGGING_LEVEL warning
COLLABORA_LOLEAFLET_HTML loleaflet.html
COLLABORA_LOLEAFLET_LOGGING false
COLLABORA_LO_TEMPLATE_PATH /opt/collaboraoffice6.0
COLLABORA_MEMPROPORTION
COLLABORA_NET_FRAME_ANCESTORS
COLLABORA_NET_LISTEN any
COLLABORA_NET_POST_ALLOW true
COLLABORA_NET_POST_ALLOW_HOSTS 127\.0\.0\.1,::1
COLLABORA_NET_PROTO all
COLLABORA_NET_SERVICE_ROOT
COLLABORA_NUM_RESPAWN_CHILDREN 1
COLLABORA_PER_DOCUMENT_AUTOSAVE_DURATION 300
COLLABORA_PER_DOCUMENT_DOCUMENT_SIGNING_URL
COLLABORA_PER_DOCUMENT_IDLESAVE_DURATION 30
COLLABORA_PER_DOCUMENT_IDLE_TIMEOUT 3600
COLLABORA_PER_DOCUMENT_LIMIT_DATA_MEM 0
COLLABORA_PER_DOCUMENT_LIMIT_FILE_SIZE 0
COLLABORA_PER_DOCUMENT_LIMIT_LOAD 100
COLLABORA_PER_DOCUMENT_LIMIT_NUM_OPEN_FILES 0
COLLABORA_PER_DOCUMENT_LIMIT_STACK_MEM 8000
COLLABORA_PER_DOCUMENT_LIMIT_VIRT_MEM 0
COLLABORA_PER_DOCUMENT_MAX_CONCURRENCY 4
COLLABORA_PER_DOCUMENT_REDLINING_AS_COMMENT true
COLLABORA_PER_VIEW_IDLE_TIMEOUT 900
COLLABORA_PER_VIEW_OUT_OF_FOCUS_TIMEOUT 60
COLLABORA_POST_SERVER_PATH /etc/post_server.d
COLLABORA_PRE_SERVER_PATH /etc/pre_server.d
COLLABORA_SECURITY_CAPABILITIES true
COLLABORA_SECURITY_SECCOMP true
COLLABORA_SERVER_NAME
COLLABORA_SSL_CA_FILE /etc/loolwsd/ca-chain.cert.pem
COLLABORA_SSL_CERT_FILE /etc/loolwsd/cert.pem
COLLABORA_SSL_CIPHER_LIST
COLLABORA_SSL_ENABLE false
COLLABORA_SSL_HPKP_ENABLE false
COLLABORA_SSL_HPKP_MAX_AGE 1000
COLLABORA_SSL_HPKP_MAX_AGE_ENABLE true
COLLABORA_SSL_HPKP_PINS
COLLABORA_SSL_HPKP_REPORT_ONLY false
COLLABORA_SSL_HPKP_REPORT_URI
COLLABORA_SSL_HPKP_REPORT_URI_ENABLE false
COLLABORA_SSL_KEY_FILE /etc/loolwsd/key.pem
COLLABORA_SSL_TERMINATION false
COLLABORA_STORAGE_FILESYSTEM_ALLOW false
COLLABORA_STORAGE_WEBDAV_ALLOW false
COLLABORA_STORAGE_WEBDAV_HOSTS_ALLOW
COLLABORA_STORAGE_WEBDAV_HOSTS_REJECT localhost
COLLABORA_STORAGE_WOPI_ALLOW true
COLLABORA_STORAGE_WOPI_HOSTS_ALLOW localhost
COLLABORA_STORAGE_WOPI_HOSTS_REJECT
COLLABORA_STORAGE_WOPI_MAX_FILE_SIZE 0
COLLABORA_SYS_TEMPLATE_PATH /opt/lool/systemplate
COLLABORA_TILE_CACHE_PATH
COLLABORA_TILE_CACHE_PERSISTENT true
COLLABORA_TRACE_COMPRESS true
COLLABORA_TRACE_ENABLE false
COLLABORA_TRACE_FILTER
COLLABORA_TRACE_OUTGOING_RECORD false
COLLABORA_TRACE_PATH
COLLABORA_TRACE_SNAPSHOW false
LC_CTYPE en_US.UTF-8
```


## Inherited environment variables

* [owncloud/ubuntu](https://github.com/owncloud-docker/ubuntu#available-environment-variables)


## Issues, Feedback and Ideas

Open an [Issue](https://github.com/owncloud-docker/collabora/issues)


## Contributing

Fork -> Patch -> Push -> Pull Request


## Authors

* [Thomas Boerger](https://github.com/tboerger)


## License

MIT


## Copyright

```
Copyright (c) 2019 Thomas Boerger <tboerger@owncloud.com>
```
