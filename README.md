# OpenCV Android SDK [![](https://jitpack.io/v/steve1316/opencv-android-sdk.svg)](https://jitpack.io/#steve1316/opencv-android-sdk)
This repo serves two purposes. One, a place to host the OpenCV Android SDK so that I would not need to download, move, rename, etc everytime I need to setup the OpenCV module for future Android projects. All that is required to access OpenCV is:

```gradle
// Project-level build.gradle
allprojects {
    repositories {
        maven { url 'https://www.jitpack.io' }
    }
}
```

```gradle
// App-level build.gradle
dependencies {
    // OpenCV Android SDK for image processing.
    implementation("com.github.steve1316:opencv-android-sdk:Tag")
}
```

The actual downloading and compiling of the OpenCV Android SDK is handled by the `setup_opencv.sh` file which is executed before generating the artifacts in the `jitpack.yml` file when requesting for a new build on Jitpack.

Second and most important, this repo is imported into the [Automation Library](https://github.com/steve1316/android-cv-automation-library) which is then propagated to every other project under it that will use it.
