# CONNECTOR DA BRD

## Sobre:

Esse script foi criado para armazenar as conexões ssh feitas dentro da empresa BRD para automatizar o login nos servidores via SSH

### Uso:

Faça o clone desse repositório em sua máquina local.

```html
    
    https://github.com/marcusaloise/server_connection.git

```
Após ter feito o clone crie um arquivo chamado "servers.conf" aonde vamos armazenar os servidores que desejamos automatizar o login.

Com o "servers.conf" criado, vamos adicionar os servidores da seguinte maneira:

```conf
    
    name_server,user,ip_server,port,descripiton

```

nesse arquivo pode ser inserido mais de 1 acesso, apenas coloque proxímo servidor em sequencia na linha em diante do anterior


Lembre-se de instalar o sshpass para a execução do programa, por conta que vamos passar a password do server pelo terminal.

```bash
    
    sudo apt-get install sshpass

```

Vamos tonar o arquivo executável: 

```bash
    
    chmod +x connector.sh

```
Agora podemos usar o script.

Podemos usar argumentos nesse script para nos mostrar a lista de servidor disponível pela seguinte forma:


```bash
    
    #input
    ./connector.sh --show

```

Ele mostrará a lista da seguinte maneira:


```bash
    
    #output
    Servidores disponiveis:
    name_server - descrição

    # O mesmo seguirá pelo <nome - descrição> para identificar quem é o servidor e sua descrição de uso e afins.

```

"Para finalmente conectar, vamos executar o script passando apenas o nome do servidor (name_server) da seguinte forma:"


> [!IMPORTANT]  
> Lembre-se que e preciso ter entrado no servidor pelo menos uma vez pela sua maquina.

```bash
    
    #input
    ./connector.sh name_server

```

Após isso o script vai criar uma conexão SSH no servidor passando porta, user, ip e a password diminuindo assim um tempo consideravel de trabalho.