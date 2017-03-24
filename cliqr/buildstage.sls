# Docker demo test
{% set cliqrtagversion = pillar['cliqrtagversion'] %}

"Build and Tag new Cliqr version":
  mc-cloud.cliqrbuild:
    - name: 'Build new cliqr image'
    - cliqrtagversion: {{ cliqrtagversion }}
    - buildtarget: 'root@osazureclient.mayo.edu'
    - targetdir: '/root'
    - cliqrsourceimage: 'cliqr/worker'