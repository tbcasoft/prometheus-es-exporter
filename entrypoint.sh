#!/bin/bash

# Default mode is CC
config="cc-exporter.cfg"
if [[ $MODE = "tc" ]] || [[ $MODE = "TC" ]]
then 
	config="tc-exporter.cfg"
fi

logFilePath="/logs/es-prometheus-exporter.log"
echo "Use configuration file: $config, and the other arguments of command: $*" >> $logFilePath
python -u /usr/local/bin/prometheus-es-exporter -c $config $* >> $logFilePath 2>&1
