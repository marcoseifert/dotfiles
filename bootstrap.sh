apt-get update 
apt-get upgrade

export USER=$(id -un)
export USERNAME=$(id -un)

apt-get install python3 -y
apt-get install pip -y
python3 -m pip install --user ansible

export PATH=$PATH:/root/.local/bin

ansible-galaxy install -r requirements.yaml

