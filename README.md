# Event Planning
Projeto para criar, compartilhar  e localizar eventos.  ou seja um organizador de eventos, no projeto e utilizado tecnologias como Beacons para a divulgação de mensagens por proximidade e como geolocalização

![](header.png)

## Instalação
Windows:

Segue instalação do flutter: <https://flutter.dev/docs/get-started/install/>

## Desenvolvimento
Antes de começar atualize as dependências do projeto
```sh
npm install
```
após atualizar as dependências, altere o conexão com o banco de dados no diretório:
```sh
server\persistencia\connection.js
```

```sh
const conexao = mysql.createConnection({
	host: '127.0.0.1',
	user: 'USUARIO',
	port: 'PORTA',
	password: 'SENHA',
	database: 'DATABASE',
});
```



## Comandos uteis mobile
Para executar:
```sh
flutter run
```

#Para verificar se as configurações do flutter
```sh
flutter doctor
```

Para gerar um apk
```sh
flutter build apk --split-per-abi
```

## Comandos uteis server
Para executar:
```sh
nodemon app.js
```
