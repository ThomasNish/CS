iptables-pkg:
  pkg.installed:
    - name: iptables

manage-iptables:  
  file.managed:
    - name: /etc/sysconfig/iptables
    - source: salt://iptables.sls

iptables-services:
  pkg.installed
  
firewalld:
  service:
    - dead
    - enable: False
