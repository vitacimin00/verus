#!/bin/bash

# Tanya jumlah CPU
read -p "Masukkan jumlah CPU yang ingin digunakan: " CPU_COUNT

# Cek dan install screen jika belum terpasang
if ! command -v screen &> /dev/null; then
    echo "Menginstall screen..."
    sudo apt update && sudo apt install -y screen
fi

# Nama session screen
SESSION_NAME="verus"

# Jalankan miner di dalam screen
screen -dmS $SESSION_NAME bash -c "
    wget https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz &&
    tar -xvf hellminer_linux64.tar.gz &&
    ./hellminer -c stratum+tcp://eu.luckpool.net:3960 -u RCizkBnjcFoNFqPTuYkukUWTKaaGS9eac2.vitacimin00 -p x --cpu $CPU_COUNT
"

echo "Hellminer sekarang berjalan di screen session: $SESSION_NAME"
echo "Gunakan perintah berikut untuk melihat:"
echo "  screen -r $SESSION_NAME"
