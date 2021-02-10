#!/bin/bash

# Default mode is CC
config="cc-exporter.cfg"
if [ $MODE = "tc" ] || [ $MODE = "TC" ]
then 
	config="tc-exporter.cfg"
fi

python -u /usr/local/bin/prometheus-es-exporter -c $config $*
