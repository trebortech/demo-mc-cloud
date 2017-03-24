{% set mayotagversion = pillar['mayotagversion'] %}

'Deploy Mayo Docker Image':
  mc-cloud.deploybuild:
    - name: 'Deploy new Mayo image'
    - mayotagversion: {{ mayotagversion }}
    - buildserver: 'root@osazureclient.mayo.edu'
    - sourcedir: '/root'
    - cliqrsourceimage: 'cliqr/worker'