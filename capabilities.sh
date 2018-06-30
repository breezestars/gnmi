#!/bin/sh
gnmi_capabilities \
  -target_addr $GNMI_TARGET:$GNMI_PORT \
  -target_name server.com \
  -alsologtostderr
