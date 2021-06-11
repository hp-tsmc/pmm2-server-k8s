FROM percona/pmm-server:2.18.0

COPY main.yml /opt/ansible/pmm2-docker/roles/pmm2-images/tasks/
COPY post-build-actions.yml /opt/ansible/pmm2/
COPY entrypoint.sh /opt/
RUN chmod a+x /opt/entrypoint.sh
RUN echo 'ansible_virtualization_type: docker' >> /opt/ansible/roles/pmm2-images/vars/main.yml
RUN echo 'ansible_virtualization_type: docker' >> /opt/ansible/pmm2-docker/roles/pmm2-images/vars/main.yml