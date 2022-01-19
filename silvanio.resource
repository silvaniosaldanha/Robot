***Variables***
${site}   		    http://www.saucedemo.com
${Navegador}  	 	Chrome
${Usuario}  	 	  css=#user-name
${senha}   		    css=#password
${Botao_Login}   	css=#login-button
${produto}        css=#item_4_title_link > div
${adicionar}      css=#add-to-cart-sauce-labs-backpack
${carrinho}       css=#shopping_cart_container > a
${finalizar}      css=#checkout
${nome}           css=#first-name
${sobrenome}      css=#last-name
${CEP}            css=#postal-code
${continue}      css=#continue
${confirmar}      css=#finish
${agradecimento}  css=#checkout_complete_container > h2

***Keywords***
Abrir loja 
  Open Browser 	 ${site}      ${Navegador}
  maximize browser window 
  set selenium speed   0.75

Fazer Login 
  Input text  	${Usuario}    standard_user
  Input Text  	${senha}      secret_sauce 
  Click Element     	${Botao_Login}

Selecionar produto e colocar no carrinho 
  click Element  ${produto}
  click Element  ${adicionar}
  
abrir o carrinho e finalizar compra 
  click Element  ${carrinho} 
  click Element  ${finalizar}

preencher dados do cliente 
  input text     ${nome}  Silvanio 
  input text     ${sobrenome}  Saldanha 
  input text     ${CEP}  32013130
  click Element  ${continue}

confirmar compra 
  click Element  ${confirmar}
  Element should contain  ${agradecimento}  THANK YOU FOR YOUR ORDER  

