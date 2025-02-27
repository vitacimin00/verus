#!/bin/bash

# Download dan ekstrak Hellminer
wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz

tar -xvf hellminer_linux64.tar.gz

# Auto-restart Hellminer jika berhenti
while true; do
    echo "Starting Hellminer..."
    ./hellminer -c stratum+tcp://ap.luckpool.net:3960 -u RCizkBnjcFoNFqPTuYkukUWTKaaGS9eac2.vitacimin00 -p x --cpu 2
    echo "Hellminer crashed! Restarting in 5 seconds..."
    sleep 5
done
