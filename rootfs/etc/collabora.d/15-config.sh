#!/usr/bin/env bash

echo "Writing config file..."
gomplate \
  -f /etc/templates/loolwsd.xml \
  -o /etc/loolwsd/loolwsd.xml

true
