#!/usr/bin/env bash

echo "Fix name resolution..."
cp -f \
	/etc/resolv.conf \
	/etc/hosts \
	${COLLABORA_SYS_TEMPLATE_PATH}/etc/

true
