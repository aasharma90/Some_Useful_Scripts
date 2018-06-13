#!/bin/sh 

MNT_FROM=aashishsharma@viml7.duckdns.org:/home/aashishsharma/Desktop/SceneFlow_Dataset
MNT_TO=/home/aashishsharma/Desktop/Datasets/SceneFlow_Dataset

if [ ! -f "${MNT_TO}" ]; then
 mkdir -p ${MNT_TO}
fi 

if mountpoint -q ${MNT_TO}/; then
 fusermount -u ${MNT_TO}
fi 

sshfs -o allow_other -o uid=$(id -u) -o gid=$(id -g) -o Ciphers=arcfour -o Compression=no ${MNT_FROM} ${MNT_TO}
