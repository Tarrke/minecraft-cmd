#!/bin/bash

. ./config.sh

cd ${SERV_PATH}

echo "save hold" >> ${FIFO_IN}
