# inovamind teste

Para Rodar o WebCrawler.search é só rodar o comando:
* $ rails runner WebCrawler.search

Que o Mesmo irá na pagina: 
* "https://quotes.toscrape.com"

E ele vai fazer a varredura em todas as paginas disponiveis que tenha as citações, e salvará no banco de dados.

Para criar um Usuário de Teste rode o comando:
* $ rails db:seed

Suba o servidor
* $ rails s -b 0.0.0.0 -p 3000

Usando o Postman 
Faça um POST em:

* localhost:3000/authenticate

e no Body, passe os parametros como:
* email: teste@teste.com
* password: 123456

e você vai obter um token, esse token é dinamico, e serve para autenticar seu acesso, dentre 24 horas seu token expira,
use o token para fazer os request.

Para realizar as buscas de frazes por tag
Utilize Get em :

* localhost:3000/quotes/{SEARCH_TAG} 

* no Header Utilize o parametro Authorization passando o token obtido no login

E com isso você terá o resultado da busca em json

Exemplos para busca:

    "friends",
    "heartbreak",
    "inspirational",
    "life",
    "love",
    "sisters",
    "live"

