#!/bin/bash

set -e

# Adjust opencv_version to designate which OpenCV version to download.
opencv_version="4.7.0"
file_name="opencv-${opencv_version}-android-sdk.zip"
download_url="https://github.com/opencv/opencv/releases/download/${opencv_version}/opencv-${opencv_version}-android-sdk.zip"

# Download the release zip file from its GitHub repo or skip the download if asked to.
if [[ $1 = "--skip-download" ]]; then
    echo "[INFO] Skipped download of ${file_name}"
else
    echo "[INFO] Preparing to download ${file_name} from its GitHub release link..."
    echo "[INFO] Now downloading from: ${download_url}"
    wget -c -O ${file_name} ${download_url}
fi

# Check if file finished downloading.
if [[ ! -f ${file_name} ]]; then
    echo "[ERROR] ${file_name} was not found!"
    exit 1
fi

echo "[SUCCESS] Finished downloading OpenCV ${opencv_version} and verified its file location."

# Now unzip the contents and move them to its required location.
echo "[INFO] Extracting the contents of the OpenCV4Android.zip from the downloaded file into a temp/ folder."
unzip -qqo ${file_name} -d temp/

echo "[INFO] Now copying sdk files from the temp/OpenCV-android-sdk/sdk/ folder to a app/ folder."
mkdir -p app/
cp -r temp/OpenCV-android-sdk/sdk/* app/

# Finally, run its gradle and clean up the temp/ folder.
# echo "[INFO] Now running OpenCV's gradle..."
# echo "android { lintOptions { abortOnError false } }" >> opencv/build.gradle

echo "[SUCCESS] OpenCV setup complete. Cleaning up now..."
rm -rf temp