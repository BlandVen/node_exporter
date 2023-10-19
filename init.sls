node_exporter:
  user.present:
    - shell: /bin/bash
    - createhome: false

/usr/local/bin/node_exporter:
  file.managed:
    - source: salt://{{ slspath }}/node_exporter
    - user: node_exporter
    - group: node_exporter
    - mode: 770

/etc/systemd/system/node_exporter.service:
  file.managed:
    - source: salt://{{ slspath }}/node_exporter.service
    - mode: 770

daemon-reload:
  cmd.run:
    - name: systemctl daemon-reload

node_exporter.service:
  service: 
    - running
    - enable: True 
