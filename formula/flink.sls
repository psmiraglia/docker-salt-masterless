flink:
    user.present:
        - fullname: Flink User
        - shell: /bin/bash

flink-binaries:
    archive.extracted:
        - name: /opt/
        - if_missing: /opt/flink-1.0.3
        - source: http://mirror.nohup.it/apache/flink/flink-1.0.3/flink-1.0.3-bin-hadoop27-scala_2.11.tgz
        - source_hash: http://www-eu.apache.org/dist/flink/flink-1.0.3/flink-1.0.3-bin-hadoop27-scala_2.11.tgz.sha
        - archive_format: tar
        - user: flink
        - group: flink
