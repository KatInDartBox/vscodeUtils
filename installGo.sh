#! /usr/bin/bash

# env
profilePath="/home/postgres/.zshrc"
downloadPath="/home/postgres/Downloads"
downloadUrl="https://go.dev/dl/go1.20.5.linux-amd64.tar.gz"
downloadName="go1.20.5.gz"
writeGoEnv="no" #yes/no

# download go
wget "${downloadUrl}" -O "${downloadPath}/${downloadName}"

# remove previous version
sudo rm -rf /usr/local/go

# extract/install go
sudo tar -C /usr/local -xzf "${downloadPath}/${downloadName}"

# write go env to .profile
if [ "$writeGoEnv" == "yes" ]; then
  sudo echo "# go env" | tee -a $profilePath
  # main go binary/ installed go binary
  sudo echo "export PATH=\$PATH:/usr/local/go/bin" | tee -a $profilePath
  # base project go path/where to install packages etc
  sudo echo "export GOPATH=/home/kat/projects/go" | tee -a $profilePath
  # binary installed by go project / go get packageName
  sudo echo "export PATH=\${PATH}:/home/kat/projects/go/bin"
fi
