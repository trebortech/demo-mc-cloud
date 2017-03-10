
{% set cliqrtagversion = pillar['cliqrtagversion'] %}


"Cliqr docker image":
  cmd.run:
    - name: "docker tag cliqr/worker:latest cliqr/worker:{{ cliqrtagversion }}"

"Save Cliqr docker image to file":
  cmd.run:
    - name: "docker save -o /root/cliqr_worker_{{ cliqrtagversion }}.tar cliqr/worker:{{ cliqrtagversion }}"

"Stage Cliqr docker file to build server":
  cmd.run:
    - name: "scp /root/cliqr_worker_{{ cliqrtagversion }}.tar root@osazureclient.mayo.edu:/root/cliqr_worker_{{ cliqrtagversion}}.tar"


