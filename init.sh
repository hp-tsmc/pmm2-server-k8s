#! /bin/bash

# mkdir -p /srv/logs
# echo '[log for main_server] ' > /srv/logs/supervisord.log

# tar -zxvf /tmp/srv.tar.gz -C srv/
# chmod -R 777 /srv/*


IFLAG='/etc/columnstore/container-initialized'
# Intialize Container If Necessary
if [ ! -e $IFLAG ]; then
    /bin/sh -c ansible-playbook -vvv -i 'localhost,' -c local /opt/ansible/pmm2-docker/main.yml     
    ansible-playbook -vvv -i 'localhost,' -c local /usr/share/pmm-update/ansible/playbook/tasks/update.yml     
    ansible-playbook -vvv -i 'localhost,' -c local /opt/ansible/pmm2/post-build-actions.yml
fi