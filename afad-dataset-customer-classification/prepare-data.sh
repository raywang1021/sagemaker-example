#!/bin/bash
age=15

cd tarball
bash restore.sh

# Total number of .jpg files
find . -type f -name '*.jpg' | wc -l

mkdir -p ../afad-train/001.101/
mkdir -p ../afad-train/002.201/
mkdir -p ../afad-train/003.102/
mkdir -p ../afad-train/004.202/
mkdir -p ../afad-train/005.103/
mkdir -p ../afad-train/006.203/

mkdir -p ../afad-val/001.101/
mkdir -p ../afad-val/002.201/
mkdir -p ../afad-val/003.102/
mkdir -p ../afad-val/004.202/
mkdir -p ../afad-val/005.103/
mkdir -p ../afad-val/006.203/

while [ $age -le 25 ]
do
echo "Copy age=$age data to destination folder"
cp AFAD-Full/$age/111/* ../afad-train/001.101/
cp AFAD-Full/$age/112/* ../afad-train/002.201/
((age++))
done

while [ $age -le 60 ]
do
echo "Copy age=$age data to destination folder"
cp AFAD-Full/$age/111/* ../afad-train/003.102/
cp AFAD-Full/$age/112/* ../afad-train/004.202/
((age++))
done

while [ $age -le 75 ]
do
echo "Copy age=$age data to destination folder"
cp AFAD-Full/$age/111/* ../afad-train/005.103/
cp AFAD-Full/$age/112/* ../afad-train/006.203/
((age++))
done

find ../afad-train/001.101/ -type f -name "*.jpg" -print0 | xargs -0 shuf -e -n 100 -z | xargs -0 cp -vt ../afad-val/001.101/
find ../afad-train/002.201/ -type f -name "*.jpg" -print0 | xargs -0 shuf -e -n 100 -z | xargs -0 cp -vt ../afad-val/002.201/

find ../afad-train/003.102/ -type f -name "*.jpg" -print0 | xargs -0 shuf -e -n 100 -z | xargs -0 cp -vt ../afad-val/003.102/
find ../afad-train/004.202/ -type f -name "*.jpg" -print0 | xargs -0 shuf -e -n 100 -z | xargs -0 cp -vt ../afad-val/004.202/

find ../afad-train/005.103/ -type f -name "*.jpg" -print0 | xargs -0 shuf -e -n 100 -z | xargs -0 cp -vt ../afad-val/005.103/
find ../afad-train/006.203/ -type f -name "*.jpg" -print0 | xargs -0 shuf -e -n 100 -z | xargs -0 cp -vt ../afad-val/006.203/
