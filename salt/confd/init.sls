Baixa o repo:
  cmd.run:
    - name: wget https://github.com/kelseyhightower/confd/releases/download/v0.13.0/confd-0.13.0-linux-amd64
    - cwd: /tmp
    - creates: /tmp/confd-0.13.0-linux-amd64

Cria o dir /opt/confd:
  file.directory:
    - name: /opt/confd/bin
    - makedirs: True
    - creates: /opt/confd/bin

Move o binario para o diretorio criado:
  file.copy:
    - name: /opt/confd/bin/confd-0.13.0-linux-amd64
    - source: /tmp/confd-0.13.0-linux-amd64
    - mode: 755