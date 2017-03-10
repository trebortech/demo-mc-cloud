{% set cliqrtagversion = pillar.get('cliqrtagversion', 'v1') %}
{% set mayotagversion = pillar.get('mayotagversion', 'v1') %}

{% set cliqrcco1 = pillar.get('cliqrcco1', '') %}
{% set cliqrbuild = pillar.get('cliqrbuild', '') %}

# Orchestration file

"Deploy initial setup states":
  salt.state:
    - tgt: '{{ cliqrcco1 }}'
    - tgt_type: list
    - sls:
      - cliqr.buildnew
    - pillar:
        cliqrtagversion: {{ cliqrtagversion }}

"Deploy initial setup states":
  salt.state:
    - tgt: '{{ cliqrbuild }}'
    - tgt_type: list
    - sls:
      - cliqr.buildnew
    - pillar:
        cliqrtagversion: {{ cliqrtagversion }}
        mayotagversion: {{ mayotagversion }}