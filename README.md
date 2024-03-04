# Teste para a Empresa Pilar - Desenvolvimento de Aplicativo de Filmes

Acesse a versão web em: [Pilar Movie Web](https://joaogomms.github.io/pilar_movie/)

## Rodando o projeto localmente:

**Não há necessidade de variável de ambiente**

- Para rodar o projeto localmente primeiro você deve clonar esse repositório com:
> `git clone https://github.com/JoaoGomms/pilar_movie.git`

- Após isso executar o seguinte comando no terminal dentro da pasta do projeto, isso vai baixar as dependências registradas pubspec.yaml
> `flutter pub get`

- Com as dependências baixadas é só executar o app com ou usando alguma IDE
> `flutter run`


## Neste teste, foi desenvolvido um aplicativo de filmes utilizando a API The Movie DB. A proposta do aplicativo consiste em três telas principais:

1. **Home Page**:

A página inicial apresenta dois botões principais que controlam os filmes exibidos nos carrosséis das seções "Populares" e "Tendências". O carrossel é animado e exibe os filmes de forma dinâmica, permitindo também o controle manual pelo usuário. Abaixo dos carrosséis, há duas listas com sessões de filmes adicionais, como "Lançamentos" e "Próximos Lançamentos". Essas listas podem ser percorridas horizontalmente de forma manual. A página também inclui uma barra de pesquisa, que permite ao usuário enviar um texto de pesquisa ao clicar em um botão ou pressionar a tecla "Enter" no teclado. Ao enviar a pesquisa, o usuário é redirecionado para a página de pesquisa.

2. **Search Page**:

Na página de pesquisa, são exibidos os cartazes dos filmes cujos títulos correspondem ao texto pesquisado pelo usuário.

3. **Movie Page**:

Ao clicar em qualquer uma das imagens dos filmes, tanto na Home Page quanto na Search Page, o usuário será redirecionado para a Movie Page.

A página de detalhes do filme exibe o cartaz do filme, seu título, resumo e elenco, apresentado em uma lista que pode ser percorrida horizontalmente. Cada item da lista exibe a foto e o nome do ator/atriz. Na parte superior da página, há um botão que retorna à página inicial.

**Além disso, para a criação deste aplicativo, foram utilizadas tecnologias como MOBX, GetIt e Http. Também foram realizados testes unitários utilizando a biblioteca Mocktail. O aplicativo foi desenvolvido seguindo a arquitetura MVC e componentização para melhor desempenho e legibilidade do código utilizando diferentes técnicas de gerencias os estados da aplicação e respostas da API.**

- **OBS** : Foram adicionados mais prints do aplicativo em funcionamento tanto no mobile quanto web na pasta app-screenshots.

## Screens

|                |WEB                           |Mobile                        |
|----------------|-------------------------------|-----------------------------|
|Home Page|-<img loading="lazy" width="900px" src="/lib/app-screenshots/web/home_page_web_1.PNG" alt="image_name png" />    |-<img loading="lazy" width="200px" src="/lib/app-screenshots/mobile/home_page_1.jpeg" alt="image_name png" />  |
|Home Page|-<img loading="lazy" width="900px" src="/lib/app-screenshots/web/home_page_web_2.PNG" alt="image_name png" />    |-<img loading="lazy" width="200px" src="/lib/app-screenshots/mobile/home_page_2.jpeg" alt="image_name png" />  |
|Movie Page|-<img loading="lazy" width="900px" src="/lib/app-screenshots/web/movie_page_web_1.jpeg" alt="image_name png" /> |-<img loading="lazy" width="200px" src="/lib/app-screenshots/mobile/movie_page_1.jpeg" alt="image_name png" /> |
|Movie Page|-<img loading="lazy" width="900px" src="/lib/app-screenshots/web/movie_page_web_1.jpeg" alt="image_name png" /> |-<img loading="lazy" width="200px" src="/lib/app-screenshots/mobile/movie_page_1.jpeg" alt="image_name png" /> |
|Movie Page|-<img loading="lazy" width="900px" src="/lib/app-screenshots/web/movie_page_web_2.jpeg" alt="image_name png" /> |-<img loading="lazy" width="200px" src="/lib/app-screenshots/mobile/movie_page_2.jpeg" alt="image_name png" />  |
|  Search Page  |-<img loading="lazy" width="900px" src="/lib/app-screenshots/web/search_page_web.jpeg" alt="image_name png" /> |-<img loading="lazy" width="200px" src="/lib/app-screenshots/mobile/search_page.jpeg" alt="image_name png" />  |






