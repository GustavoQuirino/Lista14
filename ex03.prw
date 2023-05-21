#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

User Function L14EX03()

    Local aDados  := {}
    Local nOper   := 5
    Local cFornec := ''

    Private lMsErroAuto := .F.

    cFornec := FWInputBox('Digite o código do Fornecedor pra excluir: ')

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM' 

    aADD(aDados, {'A2_FILAL',   xFilial('SA2'),          NIL}) 
    aADD(aDados, {'A2_COD',     cFornec,                 NIL}) 

    MsExecAuto({|x, y| MATA020(x, y )}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif 
Return 
