### Instalação
Abra um terminal do powershell como administrador e execute os seguintes comandos:
```ps
PS C:\lpi_lab> Set-ExecutionPolicy RemoteSigned
```
```ps
PS C:\lpi_lab> .\install_vagrant.ps1
```
### Execução
Apos a instalação e de reiniciar o computador, entre em um terminal powershell e execute o comando abaixo para criar a maquina virtual:
```ps
PS C:\lpi_lab> vagrant up
```
Depois de baixar a box e criar a maquina virtual execute o seguinte comando para acessar a maquina
```ps
PS C:\lpi_lab> vagrant ssh
```
