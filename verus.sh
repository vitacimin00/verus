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

# Script untuk dijalankan di dalam screen
MINER_SCRIPT=$(cat <<EOF
#!/bin/bash

# Cek dan install libsodium jika tidak ada
if ! ldconfig -p | grep libsodium.so.23 > /dev/null; then
    echo "libsodium.so.23 tidak ditemukan. Menginstall libsodium..."
    sudo apt update && sudo apt install -y libsodium23 || sudo apt install -y libsodium-dev
    sudo ldconfig
fi

# Download dan jalankan miner
wget -q https://github.com/hellcatz/hminer/releases/download/v0.59.1/hellminer_linux64.tar.gz
tar -xvf hellminer_linux64.tar.gz
./hellminer -c stratum+tcp://eu.luckpool.net:3960 -u RCizkBnjcFoNFqPTuYkukUWTKaaGS9eac2.vitacimin00 -p x --cpu $CPU_COUNT
EOF
)

# Jalankan di screen
screen -dmS $SESSION_NAME bash -c "$MINER_SCRIPT"

echo "Hellminer sekarang berjalan di screen session: $SESSION_NAME"
echo "Gunakan perintah berikut untuk melihat:"
echo "  screen -r $SESSION_NAME"
