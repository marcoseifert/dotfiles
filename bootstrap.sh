apt-get update 

apt-get install python3 -y
apt-get install pip -y
python3 -m pip install --user ansible

/root/.local/bin/ansible-galaxy install -r requirements.yaml

