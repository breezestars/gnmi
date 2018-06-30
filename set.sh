#!/bin/sh
gnmi_set \
  -replace /system/openflow/agent/config/max-backoff:12 \
  -update /system/clock/config/timezone-name:"US/New York" \
  -target_addr $GNMI_TARGET:$GNMI_PORT \
  -target_name server.com \
  -alsologtostderr
