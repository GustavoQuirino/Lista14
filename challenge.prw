#INCLUDE 'TOTVS.CH'
#INCLUDE 'TBICONN.CH'

User Function Challge14()

    Local cPasta    := 'C:\ADVPL\Lista14\'
    Local cArquivo  := 'Produtos.csv'

    Private oArq      := FWFileReader():New(cPasta + cArquivo)

    Processa({|| geraCad()}, "Gerando registros")

Return 

Static Function geraCad()
  
    Local cLinha    := ''
    Local aLinha    := {}
    Local aDados    := {}
    Local nOper     := 3

    Private lMsErroAuto := .F.

    PREPARE ENVIRONMENT EMPRESA '99' FILIAL '01' MODULO 'COM'
 
    if oArq:Open()
        
        if !oArq:EoF()
            
            while (oArq:HasLine())

                cLinha := oArq:GetLine()
                aLinha := StrToKArr( cLinha, ';')

                if aLinha[1] != 'Codigo' .AND. aLinha[6] != 'I'
                    aADD(aDados, {'B1_FILIAL',  xFilial('SB1'),             NIL})
                    aADD(aDados, {'B1_COD',     aLinha[1],                  NIL})
                    aADD(aDados, {'B1_DESC',  SUBSTR(aLinha[2],1,30),       NIL})
                    aADD(aDados, {'B1_TIPO',    aLinha[3],                  NIL})
                    aADD(aDados, {'B1_UM',      aLinha[4],                  NIL})
                    aADD(aDados, {'B1_LOCPAD',     '01',                    NIL})
                    aADD(aDados, {'B1_PRV1',    VAL(aLinha[5]),             NIL})
                endif 

                MsExecAuto({|x, y| MATA010(x, y )}, aDados, nOper) 
                aDados := {}
            enddo
        endif
        if lMsErroAuto
            MostraErro()
        else 
            FwAlertSuccess('Registros inseridos!', 'SUCESSO')
        endif 
    endif
    oArq:Close()

Return


