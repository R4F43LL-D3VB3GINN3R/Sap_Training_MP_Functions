FUNCTION ZVERIFY_CREDENTIALS001.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IN_LOGIN100) TYPE  ZLOGIN_100
*"     REFERENCE(IN_PASSWORD100) TYPE  ZPASSWORD_100
*"  EXPORTING
*"     REFERENCE(OK) TYPE  BOOL
*"----------------------------------------------------------------------

DATA: LT_CREDENTIALS TYPE TABLE OF ZLOGIN001, "TABELA INTERNA DO TIPO DA MINHA TABELA TRANSPARENTE.
      LS_CREDENTIALS TYPE ZLOGIN001.          "ESTRUTURA DO TIPO DA MINHA TABELA INTERNA.

SELECT SINGLE * FROM ZLOGIN001 INTO LS_CREDENTIALS           "SELECIONE UMA LINHA DA TABELA TRANSPARENTE E INSIRA NA ESTRUTURA...
    WHERE LOGIN = IN_LOGIN100 AND PASSWORD = IN_PASSWORD100. "ONDE AS ENTRIES FOREM IGUAIS AO LOGIN E SENHA DA TABELA."

  IF SY-SUBRC = 0. "SE TAIS DADOS FOREM ACHADOS E FOREM IGUAIS..."
    OK = 'X'.      "BOLEANA RECEBE OK."
  ELSE.            "DO CONTRÁRIO...
    OK = ''.       "BOLEANA RECEBE FALSE."
  ENDIF.           "ENCERRA A CONDIÇÃO."

ENDFUNCTION.