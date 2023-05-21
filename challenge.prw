#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

User Function Challge14()
    
    Local aDados  := {}
    Local nOper   := 3

    Private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'

    MsExecAuto({|x, y| MATA010(x, y )}, aDados, nOper)

    aADD(aDados, {'B1_FILAL',   xFilial('SB1'),           NIL}) 
    aADD(aDados, {'B1_COD',     '',                       NIL})
    aADD(aDados, {'B1_DESC',     '',                      NIL})
    aADD(aDados, {'B1_TIPO',     '',                      NIL})
    aADD(aDados, {'B1_UM',     '',                        NIL})
    aADD(aDados, {'B1_LOCPAD',     '',                    NIL})
    aADD(aDados, {'B1_PRV1',     '',                      NIL})

    if lMsErroAuto
        MostraErro()
    else
        FwAlertSuccess('Registros inseridos!', 'CONCLUÍDO')    
    endif 

Return 
