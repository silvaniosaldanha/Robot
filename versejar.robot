*** Settings ***
Library         SeleniumLibrary
Resource        ./versejar.resource
Test Teardown   Close Browser

*** Test Cases ***
Processo de compra no site da Livraria Versejar
  Dado que estou na página inicial do site da Livraria Versejar
  Quando eu pesquiso por "Uma empresa e seus segredos"
  E, na tela de resultados, eu clico no primeiro resultado exibido para acessar os detalhes do produto
  E valido se a informação "Compra segura" está sendo exibida na página
  E clico em "Comprar Produto"
  E valido que a mensagem "... adicionado com sucesso em seu Carrinho." está sendo exibida
  E valido que o produto foi adicionado ao carrinho
  E informo o meu CEP para calcular o custo do frete
  Então eu clico em "Fechar pedido" para concluir a compra