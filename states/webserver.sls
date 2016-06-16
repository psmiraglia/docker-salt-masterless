{% set name = {
    'RedHat': 'httpd',
    'Debian': 'apache2',
}.get(grains.os_family) %}

apache:
    pkg.installed:
        - name: {{ name }}
        - refresh: True

