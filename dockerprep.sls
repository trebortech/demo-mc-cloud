
'Python pip installed':
  pkg.installed:
    - name: python-pip

'Update PIP':
  cmd.run:
    - name: 'easy_install -U pip'
    - require:
      - pkg: 'Python pip installed'

'Prep machine for dockerng':
  pip.installed:
    - name: docker-py
    - upgrade: True
    - require:
      - cmd: 'Update PIP'