{% set cliqrtagversion = pillar.get('cliqrtagversion', 'v1') %}
{% set mayotagversion = pillar.get('mayotagversion', 'mayo-v1') %}

# Orchestration file

"Deploy initial setup states":
  salt.state:
    - tgt: 'cliqrcco1'
    - tgt_type: list
    - ssh: True
    - sls:
      - cloud.cliqr.buildstage
    - pillar:
        cliqrtagversion: {{ cliqrtagversion }}

"Deploy initial build states":
  salt.state:
    - tgt: 'cliqrbuild'
    - tgt_type: list
    - ssh: True
    - sls:
      - cloud.mayo.buildstage
    - pillar:
        cliqrtagversion: {{ cliqrtagversion }}
        mayotagversion: {{ mayotagversion }}

"Distribute latest build to ccos":
  salt.state:
    - tgt: 'cliqrcco1'
    - tgt_type: list
    - ssh: True
    - sls:
      - cloud.cliqr.deploybuild
    - pillar:
        mayotagversion: {{ mayotagversion }}