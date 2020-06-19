#!/bin/bash


####
####

. ./config.sh

cd ${SERV_PATH}

if [ ! -p ${FIFO_OUT} ]; then
	mkfifo ${FIFO_OUT}
fi

if [ ! -p ${FIFO_IN} ]; then
	mkfifo ${FIFO_IN}
fi


LD_LIBRARY_PATH=.
./bedrock_server > ${FIFO_OUT} < ${FIFO_IN} &

sleep infinity > ${FIFO_IN} &
sleep_pid=$(echo $!)

echo "Sleep PID: ${sleep_pid}"

echo ${sleep_pid} > sleep.pid

sleep 5

#echo "permission list" >> ${FIFO_IN}

#echo "stop" >> ${FIFO_IN}

#kill -9 ${sleep_pid}
