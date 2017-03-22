# Docker demo test
{% set cliqrtagversion = pillar['cliqrtagversion'] %}


"Build and Tag new Cliqr version":
  mc-cloud.cliqrbuild:
    - name: 'Build new cliqrImage'
    - cliqrtagversion: {{ cliqrtagversion }}
    - cliqrtarget: 'root@10.5.1.238'
    - cliqrsourceimage: 'cliqr/worker'