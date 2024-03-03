apt-get update && apt-get upgrade
apt-get install python3 && apt-get install pip3
python3 -m pip install --user ansible
ansible-galaxy install -r requirements.yaml

export USER=$(id -un)
export USERNAME=$(id -un)
