#!/bin/bash


########################################
# Lista os srvs disponiveis
show_servers() {
  echo "Servidores disponíveis:"
  awk -F',' '{print $1 " -" $6}' servers.conf
}

#########################################
# Função para conectar no srv solicitado
connect_server() {
  server_info=$(grep "^$1," servers.conf)
  if [ -z "$server_info" ]; then
    echo "Servidor não encontrado."
    exit 1
  fi

  user=$(echo "$server_info" | awk -F',' '{print $2}')
  ip=$(echo "$server_info" | awk -F',' '{print $3}')
  port=$(echo "$server_info" | awk -F',' '{print $4}')
  password=$(echo "$server_info" | awk -F',' '{print $5}')

  echo "Conectando ao servidor $1..."
  sshpass -p "$password" ssh "$user@$ip" -p "$port"
}

# Tratemento de argumentos (--help)
if [ "$#" -eq 0 ]; then
  echo "$0 [--show | Server_aliass]"
  exit 1
fi

#########################################
# main
case $1 in
  --show)
    show_servers
    ;;
  *)
    connect_server "$1"
    ;;
esac
