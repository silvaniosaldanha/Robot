***settings***
Library   SeleniumLibrary 
Resource   ./silvanio.resource
Test Teardown  close browser

***Test case ***
Processo de compra na Sauce Demo
  Abrir loja 
  Fazer Login
  Selecionar produto e colocar no carrinho 
  abrir o carrinho e finalizar compra 
  preencher dados do cliente 
  confirmar compra 
