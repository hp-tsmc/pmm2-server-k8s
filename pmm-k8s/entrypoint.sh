#!/bin/bash

set -o errexit

# pmm-managed-init validates environment variables.
pmm-managed-init

IFLAG='/srv/initialized'
# Intialize Container If Necessary
if [ ! -e $IFLAG ]; then
    rm -rf /srv/postgres 
    ansible-playbook -vvv -i 'localhost,' -c local /opt/ansible/pmm2-docker/main.yml     
    ansible-playbook -vvv -i 'localhost,' -c local /usr/share/pmm-update/ansible/playbook/tasks/update.yml     
    ansible-playbook -vvv -i 'localhost,' -c local /opt/ansible/pmm2/post-build-actions.yml
    touch /srv/initialized
fi

echo "wait for 5 seconds"
sleep 5

# Start supervisor in foreground
supervisord -n -c /etc/supervisord.conf
