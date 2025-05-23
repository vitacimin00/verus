#!/bin/bash

# Cek dan install screen jika belum terpasang
if ! command -v screen &> /dev/null; then
    echo "Screen belum terpasang. Menginstall screen..."
    apt install -y screen
fi

# Buat session screen dan jalankan miner di dalamnya
screen -dmS verusminer bash -c '
    # Download dan ekstrak Hellminer
    wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz
    tar -xvf hellminer_linux64.tar.gz

    # Loop auto-restart Hellminer
    while true; do
        echo "Starting Hellminer..."
        ./hellminer -c stratum+tcp://ap.luckpool.net:3960 -u RCizkBnjcFoNFqPTuYkukUWTKaaGS9eac2.vitacimin00 -p x --cpu 1
        echo "Process terminated. Restarting in 5 seconds..."
        sleep 5
    done
'
