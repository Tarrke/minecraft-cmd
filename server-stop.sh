#!/bin/bash

. ./config.sh

cd ${SERV_PATH}

echo "stop" >> ${FIFO_IN}

if [ -f sleep.pid ]; then
	kill -9 $(cat ./sleep.pid)
	rm sleep.pid
fi
