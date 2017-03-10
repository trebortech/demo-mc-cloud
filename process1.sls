{% set cliqrtagversion = pillar.get('cliqrtagversion', 'v1') %}
{% set mayotagversion = pillar.get('mayotagversion', 'v1') %}

# Orchestration file

"Deploy initial setup states":
  salt.state:
    - tgt: 'cliqrcco1'
    - tgt_type: list
    - ssh: True
    - sls:
      - cliqr.buildnew
    - pillar:
        cliqrtagversion: {{ cliqrtagversion }}

"Deploy initial build states":
  salt.state:
    - tgt: 'cliqrbuild'
    - tgt_type: list
    - ssh: True
    - sls:
      - mayo.buildnew
    - pillar:
        cliqrtagversion: {{ cliqrtagversion }}
        mayotagversion: {{ mayotagversion }}