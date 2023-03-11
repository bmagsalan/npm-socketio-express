#!/bin/bash
if [ "$RUN_DEBUG" = true ] ;  then
    echo "Running as debug"
fi

# Install ansible dependencies
python3 -m venv venv
. venv/bin/activate
pip install ansible
ANSIBLE_CFG="ansible.cfg"
cat << EOF > $ANSIBLE_CFG
[defaults]
roles_path = $PWD
interpreter_python = /usr/bin/python3
EOF
ansible-playbook install.yml