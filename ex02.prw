#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

User Function L14Ex02()

    Local aDados := {}
    Local nOper  := 4

    Private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'  

    aADD(aDados, {'A1_FILAL',   xFilial('SA1'),                NIL})
    aADD(aDados, {'A1_COD',     '000015',                      NIL})
    aADD(aDados, {'A1_END',  'Rua Alterada Automaticamente',   NIL})
    aADD(aDados, {'A1_TEL',  '11 99999-9999',                  NIL})

    MsExecAuto({|x, y| MATA030(x, y )}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif 

Return 
