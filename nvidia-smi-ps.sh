#!/bin/bash
# Script to observe GPUs occupancy (with the information of their occupant(s))
# Courtesy: Dr. Chulwoo Lee, chulwoo.lee@nus.edu.sg
nvidia-smi

# PIDS=`nvidia-smi | tail -n +25 | head -n -1 | sed 's/\s\s*/ /g' | cut -d' ' -f3`
PIDS=`nvidia-smi --query-compute-apps=pid --format=csv,noheader,nounits`
# echo "${PIDS}"

while read -r PID; do
	if [ ! -z $PID ]; then
		ps -o user,pid,cmd -p "${PID}" --no-headers
	fi
done <<< "${PIDS}"

# List of valid properties to query for the switch "--query-compute-apps=":

# Section about Active Compute Processes properties
# List of processes having compute context on the device.

# "timestamp"
# The timestamp of where the query was made in format "YYYY/MM/DD HH:MM:SS.msec".

# "gpu_name"
# The official product name of the GPU. This is an alphanumeric string. For all products.

# "gpu_bus_id"
# PCI bus id as "domain:bus:device.function", in hex.

# "gpu_serial"
# This number matches the serial number physically printed on each board. It is a globally unique immutable alphanumeric value.

# "gpu_uuid"
# This value is the globally unique immutable alphanumeric identifier of the GPU. It does not correspond to any physical label on the board.

# "pid"
# Process ID of the compute application

# "process_name" or "name"
# Process Name

# "used_gpu_memory" or "used_memory"
# Amount memory used on the device by the context. Not available on Windows when running in WDDM mode because Windows KMD manages all the memory not NVIDIA driver.
