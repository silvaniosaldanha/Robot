*** Variables ***
${SITE}                     https://livrariaversejargospel.bisws.com.br/home
${NAVEGADOR}                Chrome
${FECHAR_POPUP}             xpath=/html/body/div/div/div/a
${CAMPO_BUSCA}              id=search
${PRODUTO}                  Uma empresa e seus segredos
${PESQUISAR}                id=form-search-button
${RESULTADO}                xpath=/html/body/main/div[5]/section/div[2]/section/ul/li[1]/div[2]/h2/a
${COMPRAR_PRODUTO}          xpath=//*[@id="product_addtocart_form"]/div[6]/div/div[2]/div[2]/button
${CAMPO_CEP}                id=postcode
${CEP}                      32013130
${FECHAR_PEDIDO}            xpath=/html/body/main/div[1]/section/div[1]/div[2]/div[2]/div[2]/ul/li/button

*** Keywords ***
Dado que estou na página inicial do site da Livraria versejar
  Open Browser                      ${SITE}             ${NAVEGADOR}
  Maximize Browser Window

Quando eu pesquiso por "Uma empresa e seus segredos"
  Wait and Click                    ${FECHAR_POPUP}
  Wait and Input Text               ${CAMPO_BUSCA}      ${PRODUTO}
  Wait and Click                    ${PESQUISAR}

E, na tela de resultados, eu clico no primeiro resultado exibido para acessar os detalhes do produto
  Wait and Click                    ${RESULTADO}

E valido se a informação "Compra segura" está sendo exibida na página
  Page Should Contain               Compra segura

E clico em "Comprar produto"
  Wait and Click                    ${COMPRAR_PRODUTO}

E valido que a mensagem "... adicionado com sucesso em seu Carrinho." está sendo exibida
  Page Should Contain               adicionado com sucesso em seu Carrinho.

E valido que o produto foi adicionado ao carrinho
  Page Should Contain               ${PRODUTO}

E informo o meu CEP para calcular o custo do frete
  Wait and Input Text               ${CAMPO_CEP}        ${CEP}

Então eu clico em "Fechar pedido" para concluir a compra
  Wait and Click                    ${FECHAR_PEDIDO}

# 'Wait and Click' e 'Wait and Input Text' são keywords personalizadas que eu criei
#  para que não fosse necessário 

Wait and Click
  [Arguments]                       ${ELEMENTO}
  Wait Until Element is Visible     ${ELEMENTO}
  Wait Until Element is Enabled     ${ELEMENTO}
  Click Element                     ${ELEMENTO}

Wait and Input Text
  [Arguments]                       ${ELEMENTO}         ${TEXTO}
  Wait Until Element is Visible     ${ELEMENTO}
  Wait Until Element is Enabled     ${ELEMENTO}
  Input Text                        ${ELEMENTO}         ${TEXTO}