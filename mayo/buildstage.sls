{% set cliqrtagversion = pillar['cliqrtagversion'] %}
{% set mayotagversion = pillar['mayotagversion'] %}


"Build Mayo Docker Image":
  mc-cloud.mayobuild:
    - name: 'Build new Mayo image'
    - cliqrtagversion: {{ cliqrtagversion }}
    - mayotagversion: {{ mayotagversion }}
    - mayorepo: 'ssh://tfs.mayo.edu:22/tfs/MayoClinic/DCIS/_git/mayo-cliqr'
    - dockerfilepath: 'cliqr-worker/azurecli-worker/'
    - cliqrsourceimage: 'cliqr/worker'



