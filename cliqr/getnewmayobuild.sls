{% set mayotagversion = pillar['mayotagversion'] %}

"Copy file from build server"
  cmd.run:
    - name: "scp root@osazureclient.mayo.edu:/root/cliqr_worker_{{ mayotagversion}}.tar /root/cliqr_worker_{{ mayotagversion }}.tar"

"Load the tar file into a container"
  cmd.run:
    - name: "docker load -i /root/cliqr_worker_{{ mayotagversion}}.tar"

"delete the tar file because it's big"
  file.absent
    - name: "/root/cliqr_worker_{{ mayotagversion}}.tar"

"tag the new image as the latest"
  cmd.run:
    - name: "docker tag cliqr/worker:{{ mayotagversion }} cliqr/worker:latest"
