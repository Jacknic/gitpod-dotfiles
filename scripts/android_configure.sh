#!/bin/bash

# default JDK is 11
# https://github.com/gitpod-io/workspace-images/blob/a1a0eee4d93c8410cabc2b1d2fb882080e07e62d/dazzle.yaml#L32
export JAVA_HOME=${HOME}/.sdkman/candidates/java/current/
export ANDROID_HOME=${HOME}/.android-sdk
export ANDROID_SDK_ROOT=$ANDROID_HOME
CMD_TOOLS_DIR=${ANDROID_HOME}/cmdline-tools
CMD_TOOLS_FILE=android-commandline-tools.zip
mkdir -p ${CMD_TOOLS_DIR}
cd /tmp/ &&
    wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip -O $CMD_TOOLS_FILE &&
    unzip -q $CMD_TOOLS_FILE -d . &&
    mv cmdline-tools/ ${CMD_TOOLS_DIR}/latest &&
    rm *.zip
export PATH=${PATH}:${CMD_TOOLS_DIR}/latest/bin
yes | sdkmanager --licenses
yes | sdkmanager --update

echo 'export \n' "ANDROID_HOME=$ANDROID_HOME" \
    "ANDROID_SDK_ROOT=$ANDROID_SDK_ROOT" \
    "PATH=${PATH}" >>$HOME/.bashrc.d/100-android
