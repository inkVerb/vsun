#!/bin/sh
# vSun app, verb.ink

# This downloads the main current SOHO sun images from nana.gov and saves them according to a timestamp

# Verify the directories
if [ ! -d "/var/local/vsun" ]; then
echo "Not installed correctly. Run \"installvsun\" first. I quit."
exit 22
fi

mkdir -p /var/local/vsun/archive/dl/eit
mkdir -p /var/local/vsun/octave/ln/eit
mkdir -p /var/local/vsun/octave/out/eit
ln -sfn /var/local/vsun ~/

# Set the timestamp
timestamp=$(date +%Y_%m_%d_%T)
linkstamp=$(date +%Y_%m_%d_%H)

# Set image sizes
IMGA=171
IMGB=195
IMGC=284
IMGD=304

# Get the images
wget -O /var/local/vsun/archive/dl/eit/${timestamp}-eit-${IMGA}-1024.jpg https://sohowww.nascom.nasa.gov/data/realtime/eit_${IMGA}/1024/latest.jpg
wget -O /var/local/vsun/archive/dl/eit/${timestamp}-eit-${IMGB}-1024.jpg https://sohowww.nascom.nasa.gov/data/realtime/eit_${IMGB}/1024/latest.jpg
wget -O /var/local/vsun/archive/dl/eit/${timestamp}-eit-${IMGC}-1024.jpg https://sohowww.nascom.nasa.gov/data/realtime/eit_${IMGC}/1024/latest.jpg
wget -O /var/local/vsun/archive/dl/eit/${timestamp}-eit-${IMGD}-1024.jpg https://sohowww.nascom.nasa.gov/data/realtime/eit_${IMGD}/1024/latest.jpg

# Link the images
ln -sfn /var/local/vsun/archive/dl/eit/${timestamp}-eit-${IMGA}-1024.jpg /var/local/vsun/octave/ln/eit/${linkstamp}-${IMGA}.jpg
ln -sfn /var/local/vsun/archive/dl/eit/${timestamp}-eit-${IMGB}-1024.jpg /var/local/vsun/octave/ln/eit/${linkstamp}-${IMGB}.jpg
ln -sfn /var/local/vsun/archive/dl/eit/${timestamp}-eit-${IMGC}-1024.jpg /var/local/vsun/octave/ln/eit/${linkstamp}-${IMGC}.jpg
ln -sfn /var/local/vsun/archive/dl/eit/${timestamp}-eit-${IMGD}-1024.jpg /var/local/vsun/octave/ln/eit/${linkstamp}-${IMGD}.jpg

