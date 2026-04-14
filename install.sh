#! /bin/sh

WIN_HOME="$(wslpath "$(cmd.exe /D /C 'echo %USERPROFILE%' 2> /dev/null | tr -d '\r')")"
if [ -z "${WIN_HOME}" ]; then
    echo "Error getting windows home directory" > /dev/stderr
    exit 1
fi

LINUX_INSTALL_DIR=/usr/local/bin
WINDOWS_INSTALL_DIR="$WIN_HOME/bin"

set -x

sudo cp linux/wslrun "${LINUX_INSTALL_DIR}"
sudo chmod +x "${LINUX_INSTALL_DIR}/wslrun"

cp windows/* "${WINDOWS_INSTALL_DIR}"
cp addtowinpath.ps1 "${WINDOWS_INSTALL_DIR}/addtowinpath_x8Azj9Z.ps1"
cd "${WINDOWS_INSTALL_DIR}"
powershell.exe -ExecutionPolicy RemoteSigned  -NonInteractive -File addtowinpath_x8Azj9Z.ps1
rm addtowinpath_x8Azj9Z.ps1

