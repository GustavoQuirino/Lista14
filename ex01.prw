#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

User Function L14EX01()
    
    Local aDados := {}
    Local nOper  := 3

    Private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
    
    aADD(aDados, {'A1_FILAL',   xFilial('SA1'),       NIL})
    aADD(aDados, {'A1_COD',     '000015',             NIL})
    aADD(aDados, {'A1_LOJA',    '01',                 NIL})
    aADD(aDados, {'A1_NOME',    'Cliente Automatico', NIL})
    aADD(aDados, {'A1_NREDUZ',  'Automatico',         NIL})
    aADD(aDados, {'A1_END',     'Rua Sao Paulo',      NIL})
    aADD(aDados, {'A1_TIPO',    'F',                  NIL})
    aADD(aDados, {'A1_MUN',     'SAO PAULO',          NIL})
    aADD(aDados, {'A1_EST',     'SP',                 NIL})

    MsExecAuto({|x, y| MATA030(x, y )}, aDados, nOper)

    if lMsErroAuto
        MostraErro()
    endif 
    
Return 
