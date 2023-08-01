#!/bin/bash

# Lista os srvs disponiveis
show_servers() {
  echo "Servidores disponíveis:"
  awk -F',' '{print $1}' servers.conf
}

# Função para conectar no srv solicitado
connect_server() {
  server_info=$(grep "^$1," servers.conf)
  if [ -z "$server_info" ]; then
    echo "Servidor não encontrado."
    exit 1
  fi

  user=$(echo "$server_info" | awk -F',' '{print $2}')
  ip=$(echo "$server_info" | awk -F',' '{print $3}')

  echo "Conectando ao servidor $1..."
  ssh "$user@$ip"
}

if [ "$#" -eq 0 ]; then
  echo "Uso: $0 [--show | NOME_DO_SERVIDOR]"
  exit 1
fi

case $1 in
  --show)
    show_servers
    ;;
  *)
    connect_server "$1"
    ;;
esac