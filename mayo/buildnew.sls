
{% set cliqrtagversion = pillar['cliqrtagversion'] %}
{% set mayotagversion = pillar['mayotagversion'] %}

"Clean up workspace for build":
  file.absent:
    - name: '/root/mayo-cliqr'

"Remove existing images for Cliqr Latest":
  cmd.run:
    - name: "docker rmi cliqr/worker:latest"

"Load Cliqr docker image from file":
  cmd.run:
    - name: "docker load -i cliqr_worker_{{ cliqrtagversion }}.tar" 

"Tag new Cliqr image to be latest":
  cmd.run:
    - name: "docker tag cliqr/worker:{{ cliqrtagversion }}  cliqr/worker:latest"


"Pull down the Mayo-Cliqr docker file":
  cmd.run:
    - name: "git clone ssh://tfs.mayo.edu:22/tfs/MayoClinic/DCIS/_git/mayo-cliqr"

"Build Cliqr image with Mayo-Cliqr source dockerfile":
  cmd.run:
    - name: "docker build -t cliqr/worker:{{ mayotagversion }} --no-cache ./mayo-cliqr/cliqr-worker/azurecli-worker/"

"Move to the root directory":
  cmd.run:
    - name: "cd /root"

"Export Mayo-Cliqr docker image":
  cmd.run:
    - name: "docker save -o cliqr_worker_{{ mayotagversion }}.tar cliqr/worker:{{ mayotagversion }}"

"Create MD5 hash of new Mayo-Cliqr docker file":
  cmd.run:
    - name: "md5sum cliqr_worker_{{ mayotagversion }}.tar > cliqr_worker_{{ mayotagversion }}.tar.md5"

