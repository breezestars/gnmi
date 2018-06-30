#!/bin/sh
gnmi_target \
  -bind_address :$GNMI_PORT \
  -alsologtostderr \
  -config target_configs/typical_ofsw_config.json
