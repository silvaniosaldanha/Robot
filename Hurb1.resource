*** Variables ***
${SITE}                  http://www.hurb.com/br
${NAVEGADOR}             Chrome
${COOKIES}               css=#CybotCookiebotDialogBodyLevelButtonLevelOptinAllowAll
${PACOTES}               css=#__next > div.Header_Header__1jiZz > div.hrc-2LOsj > div > div > div.h-rwgu8t > div > div > button.hrc-Grvo8.hrc-3hPPe.hrc-3Px4y.hrc-46qds.hrc-3pyBg.hrc-3zK7t.hrc-173nT
${CAMPO_CIDADE}          css=#destination-input
${CIDADE}                NATAL 
${BOTAO_PESQUISAR}       css=#__next > div.Header_Header__1jiZz > div.hrc-2LOsj > div > div > div.h-rr9hdz > button
${SELECIONAR_VIAGEM}     xpath=//*[@id="__next"]/div/main/div[3]/a[1]/div[1]/img
${BOTAO_ESCOLHER_OPCAO}  css=body > div:nth-child(4) > section > div.box-offer-top.box-nopadding.col-sm-6.col-md-6 > div > section.box-offer-main.pull-left > div:nth-child(5) > div.pull-left.first-box > button
${BOTAO_COMPRAR}         css=#offer-options > div.offer-options--items > div.offer-option.sg-box__grids.card-last.promotion-sku.on.range-1 > div > div.col-xs-12.col-sm-4.col-md-4.offer-options--box-right.main-package > div > div.col-xs-12.col-sm-7.col-md-7.offer-options--box.offer-options--box-price.flex > div:nth-child(2) > div:nth-child(4) > a
${CONFIGURACAO}          css=#select2-quantity_LGPKG-1097564-2726856-container
${BOTAO_PARCELA}         css=#ui-id-1 > span
${CAMPO_NOME}            css=#paymentMethods__bill > section > div:nth-child(2) > div:nth-child(1) > div > input
${CAMPO_CPF}             css=#paymentMethods__bill > section > div:nth-child(2) > div:nth-child(2) > div > input
${CAMPO_CELULAR}         css=#paymentMethods__bill > section > div:nth-child(2) > div:nth-child(3) > div > input
${NUMERO_DE_PARCELAS}    css=#select2-installments\[\]-gf-container
${NOME}                  ZE DAS COVES 
${CPF}                   705.127.670-09
${CELULAR}               (31) 99999-1111
${CHECKBOX}              css=#cancellation-policy

*** Keywords ***
Abrir o site do Hurb
  Open Browser                  ${SITE}         ${NAVEGADOR}
  Maximize Browser Window
  Set Selenium Speed              0.20

Clicar em "Permitir todos os cookies"
  Sleep               5
  Wait and click      ${COOKIES}

Selecionar a opção "Pacotes"
  Wait and Click                ${PACOTES}

Buscar por cidade 
  Input Text                    ${CAMPO_CIDADE}      ${CIDADE}          NATAL    
  Wait and click                ${BOTAO_PESQUISAR} 

Selecionar um pacote de viagem
   Sleep    5
  Wait and Click                ${SELECIONAR_VIAGEM}

Clicar em "ESCOLHER OPÇÃO"
   Switch window                 New
   Wait and Click                ${BOTAO_ESCOLHER_OPCAO}

Escolher uma opção de viagem e clicar em "COMPRAR"
   Wait and Click              ${BOTAO_COMPRAR} 

Validar as informações da "Configuração" da viagem
   Wait and Click             ${CONFIGURACAO}  

Selecionar a opção "Boleto parcelado"
   Wait and Click               ${BOTAO_PARCELA}  
   Input Text                   ${CAMPO_NOME}        ${NOME}                  ZE DAS COVES 
   Input Text                   ${CAMPO_CPF}         ${CPF}                   705.127.670-09
   Input Text                   ${CAMPO_CELULAR}     ${CELULAR}               (31) 99999-1111
 
Marcar o checkbox "Li e aceito as condições de termos de uso e política de privacidade"
   Click Element      ${CHECKBOX}   

Wait and Click
  [Arguments]                       ${ELEMENTO}
  Wait Until Element is Visible     ${ELEMENTO}
  Wait Until Element is Enabled     ${ELEMENTO}
  Scroll Element Into View          ${ELEMENTO}
  Click Element                     ${ELEMENTO}

