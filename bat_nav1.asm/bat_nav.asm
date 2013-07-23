.model small
.stack 100H
.data
  ; Porta Hexa 300h - Base
  lptA DW 0300h
  lptB DW 0301h
  lptc DW 0302h
  lptD DW 0303h

  ; Vetores para controle de tiros do oponente, tiros dados e status do jogo.
  vAvioes  DB 3 DUP(255)
  vNavio   DB 3 DUP(255)
  vSubmari DB 3 DUP(255)
  vDestro  DB 3 DUP(255)
  vBarco   DB 3 DUP(255)

  vPosAcertada DB 100 DUP(0)

  vContAvioes  DB 2 DUP(0)
  vContNavio   DB 2 DUP(0)
  vContSubmari DB 2 DUP(0)
  vContDestro  DB 2 DUP(0)
  vContBarco   DB 2 DUP(0)


  ultTiro   DB (?)
  ultTiroop   DB (?)

  contGeralTeste  DB (?)
  
  resultTiro   DB (?) ;Resultado do tiro do oponente

  vStatus  DB 7 DUP(?) ;[0] - Tiros
                       ;[1] - Acertos
                       ;[2] - Afundados
                       ;[3] - Adv - Tiros 
                       ;[4] - Adv - Acertos
                       ;[5] - Adv - Afundados
                       ;[6] - Adv - Ultimo tiro
  
  ; Mensagens	
  lblMsgAcert DB "Voce acertou$"
  lblMsgErrou DB "Voce errou$"
  lblMsgGanho DB "Voce ganhou a partida$"
  lblMsgPerde DB "Voce perdeu a partida$"
  lblMsgJogar DB "E a sua vez de jogar$"
  lblMsgEsper DB "Esperando jogada do adversario$"

  ; Posição da Coluna, Linha e Direção
  PosLinha  DB (?)
  PosColuna DB (?)
  Direcao   DB (?)

  ; Status
  lblStaJogando DB "Jogando$"
  lblStaAguaRes DB "Aguardando resultado$"
  lblStaAguaOpo DB "Aguardando oponente$"
  lblStaApurRes DB "Apurando resultado$"

  ; Montagem de tela
  LinIniMatriz   DB 04h
  ColIniMatriz   DB 04h
  Espaco_1       DB " $"
  Espaco_2       DB "  $"
  Espaco1_Separ  DB " ", 179, '$'
  Espaco20_Separ DB 20 DUP(" "), 179, '$'
  Separador      DB 179, '$'
  PulaLinha      DB 13, 10, '$'
  LinCabSup      DB " ", 218, 22 DUP(196), 191, '$'
  LinCabMeio     DB " ", 195, 22 DUP(196), 180, '$'
  LinCabInf      DB " ", 192, 22 DUP(196), 217, '$'
  LinCabTiros    DB " ", 179, "   Matriz de Tiros    ", 179, '$'
  LinCabNavios   DB " ", 179, "   Matriz de Navios   ", 179, '$'
  LinCabNum      DB " ", 179, "  0 1 2 3 4 5 6 7 8 9 ", 179, '$'
  LinNum_0       DB " ", 179, "0 $"
  LinNum_1       DB " ", 179, "1 $"
  LinNum_2       DB " ", 179, "2 $"
  LinNum_3       DB " ", 179, "3 $"
  LinNum_4       DB " ", 179, "4 $"
  LinNum_5       DB " ", 179, "5 $"
  LinNum_6       DB " ", 179, "6 $"
  LinNum_7       DB " ", 179, "7 $"
  LinNum_8       DB " ", 179, "8 $"
  LinNum_9       DB " ", 179, "9 $"
  LinResVazia    DB "  ", 179, 22 DUP(" "), 179, '$'
  LinVoce        DB "  ", 179, " Voce", 17 DUP(" "), 179, '$'
  LinAdvers      DB "  ", 179, " Adversario", 11 DUP(" "), 179, '$'
  LinTiros       DB "  ", 179, 4 DUP(" "), "Tiros:", 8 DUP(" "), "00  ", 179, '$'
  LinAcertos     DB "  ", 179, 4 DUP(" "), "Acertos:", 6 DUP(" "), "00  ", 179, '$'
  LinAfundados   DB "  ", 179, 4 DUP(" "), "Afundados:", 4 DUP(" "), "00  ", 179, '$'
  LinUltTiro     DB "  ", 179, 4 DUP(" "), "Ultimo tiro:  00  ", 179, '$'
  LinCabSupMsg   DB " ", 218, 73 DUP(196), 191, '$'
  LinCabMsg      DB " ", 179, " Mensagens:", 62 DUP(" "), 179, '$'
  LinBrancoMsg   DB " ", 179, 73 DUP(" "), 179, '$'
  LinCabMeioMsg  DB " ", 195, 22 DUP(196), 194, 196, 194, 22 DUP(196), 194, 196, 196, 194, 22 DUP(196), 180, '$'
  LinPortas      DB " ", 179, " Porta B", 14 DUP(" "), 179, " ", 179, " Porta C", 14 DUP(" "), 179, "  ", 179, " Tiro", 17 DUP(" "), 179, '$'
  LinBrancoPort  DB " ", 179, 22 DUP(" "), 179, " ", 179, 22 DUP(" "), 179, "  ", 179, 22 DUP(" "), 179, '$'
  LinCabInfPort  DB " ", 192, 22 DUP(196), 217, " ", 192, 22 DUP(196), 217, "  ", 192, 22 DUP(196), 217, '$'

  constAvioes  EQU "Porta Avioes"
  constNavio   EQU "Navio de Guerra"
  constSubmari EQU "Submarino"
  constDestro  EQU "Destroyer"
  constBarco   EQU "Barco Patrulha"
  constLinCol  EQU "LC:"

  lblAvioes  DB constAvioes, '$'
  lblNavio   DB constNavio, '$'
  lblSubmari DB constSubmari, '$'
  lblDestro  DB constDestro, '$'
  lblBarco   DB constBarco, '$'
  lblLinCol  DB constLinCol, '$'
  lblBranco  DB 15 DUP(" "), '$'
  lblBrancoGrande  DB 30 DUP(" "), '$'
  lblBrancoPequeno DB 3 DUP(" "), '$'

  constLetAvioes  EQU "A"
  constLetNavio   EQU "B"
  constLetSubmari EQU "S"
  constLetDestro  EQU "D"
  constLetBarco   EQU "P"

  lblLetAvioes  DB constLetAvioes, " $"
  lblLetNavio   DB constLetNavio, " $"
  lblLetSubmari DB constLetSubmari, " $"
  lblLetDestro  DB constLetDestro, " $"
  lblLetBarco   DB constLetBarco, " $"

  LinCabLegSup  DB " ", 218, 36 DUP(196), 191, 13, 10, '$'
  LinCabLegenda DB " ", 179, 15 DUP(" "), "LEGENDA", 14 DUP(" "), 179, 13, 10, '$'
  LinCabLegMeio DB " ", 195, 16 DUP(196), 194, 9 DUP(196), 194, 9 DUP(196), 180, 13, 10, '$'
  LinLegTitulo  DB " ", 179, "   Embarcacao   ", 179, " Simbolo ", 179, " Tamanho ", 179, 13, 10, '$'
  LinCabLegMei2 DB " ", 195, 16 DUP(196), 197, 9 DUP(196), 197, 9 DUP(196), 180, 13, 10, '$'
  LinLegAvioes  DB " ", 179, constAvioes, "    ", 179, "    ", constLetAvioes, "    ", 179, "    5    ", 179, 13, 10, '$'
  LinLegNavio   DB " ", 179, constNavio, " ", 179, "    ", constLetNavio, "    ", 179, "    4    ", 179, 13, 10, '$'
  LinLegSubmari DB " ", 179, constSubmari, 7 DUP (" "), 179, "    ", constLetSubmari, "    ", 179, "    3    ", 179, 13, 10, '$'
  LinLegDestro  DB " ", 179, constDestro, 7 DUP(" "), 179, "    ", constLetDestro, "    ", 179, "    3    ", 179, 13, 10, '$'
  LinLegBarco   DB " ", 179, constBarco, "  ", 179, "    ", ConstLetBarco, "    ", 179, "    2    ", 179, 13, 10, '$'
  LinCabLegInf  DB " ", 192, 16 DUP(196), 193, 9 DUP(196), 193, 9 DUP(196), 217, 13, 10, '$'
  LinDigite     DB " ", 179, "  Digite a posicao do ", 179, 13, 10, '$'

.code

ESC_INT proc ; Escreve o inteiro que esta em AX para a tela
	push AX
	push BX
	push CX
	push DX
  
	;mov AX, DX
	mov BX, 10
	xor CX, CX
lc_esc_int32:
	div BL
	mov DX, AX
	shr DX, 8
	add DX, '0'
	push DX
	mov AH, 0
	inc CX
	or AX, AX
	jnz lc_esc_int32
escreve_int32:
	pop DX
	call ESC_CHAR
	loop escreve_int32
  
	pop DX
	pop CX
	pop BX
	pop AX
	ret
endp

ESC_UINT16 proc    ; Escreve valor em AX
  push AX
  push BX
  push DX
  push CX

  mov  BX, 10
  xor  CX, CX
  xor  DX, DX

LACO2:
  div  BX    ; [DX=RESTO   AX=QUOCIENTE]    		
  add  DL, '0'    ; transform. em caracter
  push DX
  inc  CX	

  xor  AH, AH
  or   AX, AX
  jnz  LACO2

LACO3:
  pop  DX
  call ESC_CHAR
  loop LACO3

  pop  CX
  pop  DX
  pop  BX
  pop  AX    ; Desempilha registradores
  ret
endp

ESC_CHAR proc
  push AX

  mov  AH, 02h    ; Função para escrever um caracter no vídeo
  int  21h

  pop  AX
  ret
endp

ESC_STRING PROC    ; Escreve uma string, sendo que sua posição inicial deve estar em DX e a palavra terminar com $
  push AX
  push DX

  mov  AH, 09h    ; Código de interrupção para escrever string
  int  21h

  pop  DX
  pop  AX
  ret
endp

ESC_CHAR_COLORIDO proc    ; Escreve o caracter que está setado em DL com a cor que está setada em DH
	push AX
	push BX
	push CX
	push DX

	mov AH, 0Ah
	mov AL, DL
	mov CX, 01h
	mov BH, 00h
	mov BL, DH
	int 10h

	pop DX
	pop CX
	pop BX
	pop AX
	ret
endp

HABILITA_COR proc    ; seta o modo de vídeo para permitir cores no mesmo, utiliza interrução de vídeo 10H
  push AX

  mov  AH, 00h
  mov  AL, 10h 
  int  10h

  pop  AX
  ret
endp

POSICIONAR_CURSOR proc    ; posiciona o cursor na posição X e Y (DL, DH)
  push AX
  push BX

  XOR ax, ax
  mov  AH, 02h
  mov  BH, 00h
  int  10h

  pop  BX
  pop  AX
  ret
endp

LE_CHAR proc    ; Le um caracter e retorna em AL
  mov  AH, 07h
  int  21h
  ret
endp

LE_UINT16 proc
  push CX
  push DX

  xor  AX, AX
  xor  CX, CX
LEITURA:
  push AX
  call LE_CHAR
  cmp  AL, 13    ; Pressionou Enter(#13)
  jz   FIM
  mov  DL, AL
  call ESC_CHAR
  sub  AL, '0'    ; Transforma de caracter para número
  mov  CL, AL
  pop  AX
  ADD  AX, CX
  jmp LEITURA
FIM:
  pop AX
  pop DX
  pop CX
  ret
endp

LE_LINHA_COLUNA proc
  push AX
  push CX
  push DX

  xor  AX, AX
LER_INT1:
  call LE_CHAR
  cmp  AL, 30h    ; "0" na tabela ASCII
  jb   LER_INT1
  cmp  AL, 39h    ; "9" na tabela ASCII
  ja   LER_INT1
  mov  DL, AL
  call ESC_CHAR
  sub  AL, '0'    ; Transforma de caracter para número
  mov  PosLinha, AL

LER_INT2:
  call LE_CHAR
  cmp  AL, 30h    ; "0" na tabela ASCII
  jb   LER_INT2
  cmp  AL, 39h    ; "9" na tabela ASCII
  ja   LER_INT2
  mov  DL, AL
  call ESC_CHAR
  sub  AL, '0'    ; Transforma de caracter para número
  mov  PosColuna, AL

  pop AX
  pop CX
  pop DX
  ret
endp

LE_DIRECAO proc
  push AX
  push CX
  push DX

LER_DIREC:
  call LE_CHAR
  cmp  AL, 48h    ; "H" na tabela ASCII
  jz   ESCREVER
  cmp  AL, 56h    ; "V" na tabela ASCII
  jnz  LER_DIREC
ESCREVER:
  mov  DL, AL
  call ESC_CHAR
  mov  Direcao, AL

  pop AX
  pop CX
  pop DX
  ret
endp

LIMPA_TELA proc    ; Limpa a tela de vídeo com base no código 03H da interrupção de vídeo 10h
  push AX

  mov  AX, 03h
  int  10h

  pop  AX
endp

ESC_LINHA_TIROS proc    ; Escreve a linha (AH) e coluna (AL) do tabuleiro
	push BX
	push CX
	push DX

  mov  CX, 0Ah
  xor  BX, BX
LOOP1:
  mov  DX, AX

  add  DX, BX
  add  BX, 2
  call POSICIONAR_CURSOR

  mov  DH, 02h
  mov  DL, 254
  call ESC_CHAR_COLORIDO
  loop LOOP1

  mov  DX, AX
  add  DX, BX
  call POSICIONAR_CURSOR

  mov  AH, 09h
  mov  DX, OFFSET Separador
  int  21h

	pop DX
	pop CX
	pop BX
	ret
endp

DESENHAR_TELA_INICIAL macro    ; Desenha a tela inicial
  mov  AH, 09h    ; Função para escrever string no vídeo

  ; Linha 0
  mov  DX, OFFSET LinCabSup
  int  21h
  mov  DX, OFFSET LinCabLegSup
  int  21h

  ; Linha 1
  mov  DX, OFFSET LinCabNavios
  int  21h
  mov  DX, OFFSET LinCabLegenda
  int  21h

  ; Linha 2
  mov  DX, OFFSET LinCabMeio
  int  21h
  mov  DX, OFFSET LinCabLegMeio
  int  21h

  ; Linha 3
  mov  DX, OFFSET LinCabNum
  int  21h
  mov  DX, OFFSET LinLegTitulo
  int  21h

  ; Linha 4
  mov  DX, OFFSET LinNum_0
  int  21h
  mov  DX, 0417h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET LinCabLegMei2
  int  21h

  ; Linha 5
  mov  DX, OFFSET LinNum_1
  int  21h
  mov  DX, 0517h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET LinLegAvioes
  int  21h

  ; Linha 6
  mov  DX, OFFSET LinNum_2
  int  21h
  mov  DX, 0617h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET LinLegNavio
  int  21h

  ; Linha 7
  mov  DX, OFFSET LinNum_3
  int  21h
  mov  DX, 0717h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET LinLegSubmari
  int  21h

  ; Linha 8
  mov  DX, OFFSET LinNum_4
  int  21h
  mov  DX, 0817h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET LinLegDestro
  int  21h

  ; Linha 9
  mov  DX, OFFSET LinNum_5
  int  21h
  mov  DX, 0917h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET LinLegBarco
  int  21h

  ; Linha 10
  mov  DX, OFFSET LinNum_6
  int  21h
  mov  DX, 0A17h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET LinCabLegInf
  int  21h

  ; Linha 11
  mov  DX, OFFSET LinNum_7
  int  21h
  mov  DX, 0B17h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 12
  mov  DX, OFFSET LinNum_8
  int  21h
  mov  DX, 0C17h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 13
  mov  DX, OFFSET LinNum_9
  int  21h
  mov  DX, 0D17h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 14
  mov  DX, OFFSET LinCabInf
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 15
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 16
  mov  DX, OFFSET LinCabSup
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 17
  mov  DX, OFFSET LinDigite
  int  21h

  ; Linha 18
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, 1218h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Separador
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 19
  mov  DX, OFFSET Espaco1_Separ
  int  21h
  mov  DX, 1318h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET Separador
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  mov  DX, OFFSET LinCabInf
  int  21h
endm

POS_DIGITE_EMB proc    ; Posiciona o cursor na posição para ler a posição da embarcação
  push DX

  mov  DX, 130Bh
  call POSICIONAR_CURSOR

  pop  DX
  ret
endp

LIMPA_NOME_EMB proc    ; Limpa o nome da embarcação para poder escrever a próxima embarcação
  push DX

  mov  DX, 1205h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET lblBranco
  int  21h

  mov  DX, 1305h
  call POSICIONAR_CURSOR
  mov  AH, 09h
  mov  DX, OFFSET lblBranco
  int  21h

  mov  DX, 1205h
  call POSICIONAR_CURSOR

  pop  DX
  ret
endp

VALIDA_POSICAO proc
; Valida a posição nos limites da matriz conforme a quantidade de vezes que está em CX e na direção que está "Direcao".
; Retorna AL=0 se validou, caso contrário retorna AL=1
  push DX
  push CX
  push BX

  mov  DL, PosColuna
  mov  DH, PosLinha
  call POS_OCUPADA
  cmp  AL, 0
  jnz  ERRO_1

  dec  CX    ; Decrementa 1, pois é posição inicial
LACO:
  cmp  Direcao, 56h    ; Se for "V" (Vertical)
  jz   SOMA_LIN
  inc  DL
  jmp  FAZ_LACO
SOMA_LIN:
  inc  DH
FAZ_LACO:
  call POS_OCUPADA
  cmp  AL, 0
  jnz  ERRO_1
  loop LACO
  
  cmp  DL, 09h    ; Compara a coluna
  ja   ERRO_1
  cmp  DH, 09h    ; Compara a linha
  ja   ERRO_1

OK_1:
  mov  AL, 0
  jmp  RES_VP
ERRO_1:
  mov  AL, 1

RES_VP:
  pop  BX
  pop  CX
  pop  DX
  ret
endp

POS_OCUPADA proc    ; Verifica se a posição da matriz já possui embarcação. DL -> PosColuna; DH -> PosLinha
; Retorna AL=0 se posição desocupada, caso contrário retorna em AL a embarcação que está ocupando
  push  CX
  push  BX
  push  DX
  
  ; Aviões
  mov  CX, 5
  mov  BX, OFFSET vAvioes
  call OCUPADA
  cmp  AL, 0
  jnz  ERRO_AV

  ; Navio
  mov  CX, 4
  mov  BX, OFFSET vNavio
  call OCUPADA
  cmp  AL, 0
  jnz  ERRO_NA

  ; Submarino
  mov  CX, 3
  mov  BX, OFFSET vSubmari
  call OCUPADA
  cmp  AL, 0
  jnz  ERRO_SU

  ; Destroyer
  mov  CX, 3
  mov  BX, OFFSET vDestro
  call OCUPADA
  cmp  AL, 0
  jnz  ERRO_DE

  ; Barco
  mov  CX, 2
  mov  BX, OFFSET vBarco
  call OCUPADA
  cmp  AL, 0
  jnz  ERRO_BA

; Está desocupada
  mov  AL, 0
  jmp  RES_POS

ERRO_AV:
  mov  AL, constLetAvioes
  jmp  RES_POS
ERRO_NA:
  mov  AL, constLetNavio
  jmp  RES_POS
ERRO_SU:
  mov  AL, constLetSubmari
  jmp  RES_POS
ERRO_DE:
  mov  AL, constLetDestro
  jmp  RES_POS
ERRO_BA:
  mov  AL, constLetBarco

RES_POS:
  pop   DX
  pop   BX
  pop   CX
  ret
endp

OCUPADA proc    ; Verifica se a posição está ocupada. DL -> PosColuna; DH -> PosLinha
; Retorna AL=0 se posição desocupada, caso contrário retorna em AL=1
  push  CX
  push  BX

  mov  AH, [BX + 2]
  cmp  AH, 0FFh    ; caso não tenha posição definida
  jz   OK_OC
LOOP_OC:
  mov  AL, [BX]
  cmp  AH, 56h    ; Se for "V" (Vertical)
  jnz  LIN_OC
  add  AL, CL
  dec  AL
LIN_OC:    ; Linha
  cmp  AL, DH
  jnz  FAZ_LOOP
  mov  AL, [BX + 1]
  cmp  AH, 56h    ; Se for "V" (Vertical)
  jz   COL_OC
  add  AL, CL
  dec  AL
COL_OC:    ; Coluna
  cmp  AL, DL
  jz   ERRO_OC
FAZ_LOOP:
  loop LOOP_OC

OK_OC:
  mov  AL, 0
  jmp  RES_PO
ERRO_OC:
  mov  AL, 1

RES_PO:
  pop   BX
  pop   CX
  ret
endp

SET_VETOR proc    ; Coloca a Linha, Coluna e Direcao no vetor que inicia em BX
  push BX
  push AX

  mov  AL, PosLinha
  mov  [BX], AL
  mov  AL, PosColuna
  mov  [BX + 1], AL
  mov  AL, Direcao
  mov  [BX + 2], AL

  pop  AX
  pop  BX
  ret
endp

SET_COL_LIN_DIR proc    ; Seta a PosLinha, PosColuna e Direcao conforme com a posição inicial do vetor que inicia em BX
  push BX
  push AX

  mov  AL, [BX]
  mov  PosLinha, AL
  mov  AL, [BX + 1]
  mov  PosColuna, AL
  mov  AL, [BX + 2]
  mov  Direcao, AL

  pop  AX
  pop  BX
  ret
endp

ESC_EMBARCACAO proc    ; Escreve na matriz o valor de DX a quantidade de vezes que está em CX e na direção que está "Direcao"
  push DX
  push CX
  push BX
  push AX

  mov  BX, DX

  shl  PosColuna, 1
  mov  AL, ColIniMatriz
  add  PosColuna, AL    ; A coluna inicial começa em ColIniMatriz

  mov  DL, PosColuna
  add  PosLinha, 04h    ; Sempre começa na linha 4
  mov  DH, PosLinha
  call POSICIONAR_CURSOR
  mov  AH, 09h
IMPRIME:
  mov  DX, BX
  int  21h
  cmp  Direcao, 56h    ; Se for "V" (Vertical)
  jnz  LOOP_1
  add  PosLinha, 01h
  mov  DL, PosColuna
  mov  DH, PosLinha
  call POSICIONAR_CURSOR
  mov  AH, 09h
LOOP_1:
  loop IMPRIME

  pop  AX
  pop  BX
  pop  CX
  pop  DX
  ret
endp

LE_EMBARCACOES macro   ; Lê a posição das embarcações
  ; Porta Aviões
LE_AVIOES:
  call LIMPA_NOME_EMB
  mov  DX, OFFSET lblAvioes
  int  21h
  call POS_DIGITE_EMB
  call LE_LINHA_COLUNA
  call LE_DIRECAO

  mov  CX, 5
  call VALIDA_POSICAO
  cmp  AL, 1
  jz   LE_AVIOES
  mov  BX, OFFSET vAvioes
  call SET_VETOR
  mov  DX, OFFSET lblLetAvioes
  call ESC_EMBARCACAO

  ; Navio de Guerra
LE_NAVIO:
  call LIMPA_NOME_EMB
  mov  DX, OFFSET lblNavio
  int  21h
  call POS_DIGITE_EMB
  call LE_LINHA_COLUNA
  call LE_DIRECAO

  mov  CX, 4
  call VALIDA_POSICAO
  cmp  AL, 1
  jz   LE_NAVIO
  mov  BX, OFFSET vNavio
  call SET_VETOR
  mov  DX, OFFSET lblLetNavio
  call ESC_EMBARCACAO

  ; Submarino
LE_SUBMARI:
  call LIMPA_NOME_EMB
  mov  DX, OFFSET lblSubmari
  int  21h
  call POS_DIGITE_EMB
  call LE_LINHA_COLUNA
  call LE_DIRECAO

  mov  CX, 3
  call VALIDA_POSICAO
  cmp  AL, 1
  jz   LE_SUBMARI
  mov  BX, OFFSET vSubmari
  call SET_VETOR
  mov  DX, OFFSET lblLetSubmari
  call ESC_EMBARCACAO

  ; Destroyer
LE_DESTRO:
  call LIMPA_NOME_EMB
  mov  DX, OFFSET lblDestro
  int  21h
  call POS_DIGITE_EMB
  call LE_LINHA_COLUNA
  call LE_DIRECAO

  mov  CX, 3
  call VALIDA_POSICAO
  cmp  AL, 1
  jz   LE_DESTRO
  mov  BX, OFFSET vDestro
  call SET_VETOR
  mov  DX, OFFSET lblLetDestro
  call ESC_EMBARCACAO

  ; Barco Patrulha
LE_BARCO:
  call LIMPA_NOME_EMB
  mov  DX, OFFSET lblBarco
  int  21h
  call POS_DIGITE_EMB
  call LE_LINHA_COLUNA
  call LE_DIRECAO

  mov  CX, 2
  call VALIDA_POSICAO
  cmp  AL, 1
  jz   LE_BARCO
  mov  BX, OFFSET vBarco
  call SET_VETOR
  mov  DX, OFFSET lblLetBarco
  call ESC_EMBARCACAO
endm

ESC_MATRIZ_NAVIO macro
 
  mov  ColIniMatriz, 1Dh

  mov  BX, OFFSET vAvioes
  call SET_COL_LIN_DIR
  mov  CX, 5
  mov  DX, OFFSET lblLetAvioes
  call ESC_EMBARCACAO

  mov  BX, OFFSET vNavio
  call SET_COL_LIN_DIR
  mov  CX, 4
  mov  DX, OFFSET lblLetNavio
  call ESC_EMBARCACAO

  mov  BX, OFFSET vSubmari
  call SET_COL_LIN_DIR
  mov  CX, 3
  mov  DX, OFFSET lblLetSubmari
  call ESC_EMBARCACAO

  mov  BX, OFFSET vDestro
  call SET_COL_LIN_DIR
  mov  CX, 3
  mov  DX, OFFSET lblLetDestro
  call ESC_EMBARCACAO

  mov  BX, OFFSET vBarco
  call SET_COL_LIN_DIR
  mov  CX, 2
  mov  DX, OFFSET lblLetBarco
  call ESC_EMBARCACAO
endm

DESENHAR_TELA_JOGO macro    ; Desenha a tela do jogo
  mov  AH, 09h    ; Função para escrever string no vídeo

  mov  ColIniMatriz, 04h

  ; Linha 0
  mov  DX, OFFSET LinCabSup
  int  21h
  mov  DX, OFFSET LinCabSup
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 1
  mov  DX, OFFSET LinCabTiros
  int  21h
  mov  DX, OFFSET LinCabNavios
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 2
  mov  DX, OFFSET LinCabMeio
  int  21h
  mov  DX, OFFSET LinCabMeio
  int  21h
  mov  DX, OFFSET Espaco_1
  int  21h
  mov  DX, OFFSET LinCabSup
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 3
  mov  DX, OFFSET LinCabNum
  int  21h
  mov  DX, OFFSET LinCabNum
  int  21h
  mov  DX, OFFSET LinVoce
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h


  ; Linha 4
  mov  DX, OFFSET LinNum_0
  int  21h
  mov  AH, LinIniMatriz
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_0
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinTiros
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 5
  mov  DX, OFFSET LinNum_1
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 1
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_1
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinAcertos
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 6
  mov  DX, OFFSET LinNum_2
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 2
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_2
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinAfundados
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 7
  mov  DX, OFFSET LinNum_3
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 3
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_3
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinResVazia
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 8
  mov  DX, OFFSET LinNum_4
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 4
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_4
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET Espaco_1
  int  21h
  mov  DX, OFFSET LinCabMeio
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 9
  mov  DX, OFFSET LinNum_5
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 5
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_5
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinAdvers
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 10
  mov  DX, OFFSET LinNum_6
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 6
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_6
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinTiros
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 11
  mov  DX, OFFSET LinNum_7
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 7
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_7
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinAcertos
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 12
  mov  DX, OFFSET LinNum_8
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 8
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_8
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinAfundados
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 13
  mov  DX, OFFSET LinNum_9
  int  21h
  mov  AH, LinIniMatriz
  add  AH, 9
  mov  AL, ColIniMatriz
  call ESC_LINHA_TIROS
  mov  DX, OFFSET LinNum_9
  int  21h
  mov  DX, OFFSET Espaco20_Separ
  int  21h
  mov  DX, OFFSET LinUltTiro
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 14
  mov  DX, OFFSET LinCabInf
  int  21h
  mov  DX, OFFSET LinCabInf
  int  21h
  mov  DX, OFFSET Espaco_1
  int  21h
  mov  DX, OFFSET LinCabInf
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 15 - Linha em branco
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 16
  mov  DX, OFFSET LinCabSupMsg
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 17
  mov  DX, OFFSET LinCabMsg
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 18
  mov  DX, OFFSET LinBrancoMsg
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 19
  mov  DX, OFFSET LinCabMeioMsg
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 20
  mov  DX, OFFSET LinPortas
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 21
  mov  DX, OFFSET LinBrancoPort
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h

  ; Linha 22
  mov  DX, OFFSET LinCabInfPort
  int  21h
  mov  DX, OFFSET PulaLinha
  int  21h
endm

DEFINE_PPA_INT macro    ; Cria interrupção para controlar PPA
  push AX
  push DS

  mov  AX, SEG ACESSO_PPA    ; Move segmento onde esta controle ppa, para posteriormente setar na pos 06 das int
  mov  DS, AX
  mov  AH, 25h    ; Vetor de interrupção
  mov  AL, 6Fh    ; Ordem trabalho
  mov  DX, OFFSET ACESSO_PPA    ; Criar interrupção
  int  21h

  pop  DS
  pop  AX
endm

ACESSO_PPA proc    ; Acessa PPA e escreve/ou/LE VALORES - passar PORTA A SER ACESSADA NA PARTE ALTA DE AX(AH) e valor em AL. 
  ; 0A = porta A
  ; 0B = porta B
  ; 0C = porta C - Escrita 
  ; 1C = porta C - Leitura
  ; 0D = porta D   
  sti
  push BX
  push DX
  push CX

  cmp  AH, 0Ah
  jz   porta_a
  cmp  AH, 0Bh
  jz   porta_b
  cmp  AH, 0Ch    ; Porta C parte alta
  jz   porta_Cl
  cmp  AH, 1Ch    ; Porta C parte baixa
  jz   porta_Ch
  cmp  AH, 0Dh
  jz   porta_d
  jmp  finalizar_interrupcao

PORTA_A:
  mov  DX, lptA
  xor CX, CX
  out  DX, AL
  jmp  ESC_TELA

PORTA_B:
  mov  DX, lptB
  xor AL, AL
  xor CX, CX
  in   AL, DX
  
  cmp AL, 0FFH
  ;problema  bancada
  jnz contb
  mov AL, 00H
  
  contb:
  call fGUARDA_TIRO_OP
  jmp  ESC_TELA

PORTA_CL:
  mov  DX, lptC
  and  AL, 0Fh    ; Zera bits mais sig.      
  xor CX, CX
  out  DX, AL
  jmp  ESC_TELA

PORTA_CH:
  mov  DX, lptC
  xor AL, AL    ; Zera AL
  xor CX, CX
  in   AL, DX
  shr AL, 4
  ;and  AL, 0F0h    ; Zera bits MENOS sig.     
  jmp  ESC_TELA

PORTA_D:
  mov  DX, lptD    ; Programa modo de operação da porta
  out  DX, AL
  jmp  FINALIZAR_INTERRUPCAO
  
ESC_TELA:
  call fATUALIZA_PORTAS

FINALIZAR_INTERRUPCAO:
  pop CX
  pop DX
  pop BX
  iret
endp


fATUALIZA_PORTAS proc    ; ESCREVE VALOR LIDO DAS PORTAS
                         ;AL - VALOR P/ IMPRIMIR
                         ;AH - PORTA
  push DX

  cmp  AH, 0Bh
  jz   porta_bi
  cmp  AH, 0Ch    ; Porta C parte alta
  jz   porta_Cli
  cmp  AH, 1Ch    ; Porta C parte baixa
  jz   porta_Chi
  jmp  fimr

  porta_bi:
    mov DH, 15H;
    mov DL, 09H; 
    jmp IMPRIME_POR
  porta_cli:
    mov DH, 15H;
    mov DL, 20H; 
    jmp IMPRIME_POR
  porta_chi:
    mov DH, 15H;
    mov DL, 28H; 
  
IMPRIME_POR:

  push DX
  call POSICIONAR_CURSOR
  mov  AH, 09H
  mov  DX, OFFSET lblBrancoPequeno
  push AX
  int  21H
  pop AX
  pop DX

  call POSICIONAR_CURSOR
  XOR AH, AH
  call ESC_INT
    
fimr:
  pop  DX
  ret
endp


fAGUARD_JOGADA proc ;Jogando
  ;Envia 0 para PC0
  mov AH, 0CH  ;Escrita
  mov AL, 00H 
  int 6FH      ; Escreve flags (PC3-PC2-PC1-PC0)
  

  ;Aguarda coordenada do tiro pelo jogador
  call fLE_TIRO

  ;Envia coordenada para a Porta A - Coordenada ja deve estar em AL
  mov AH, 0AH  ;Escrita
  int 6FH      ; Escreve flags
  
  ;GUARDA MEU ULTIMO TIRO
  push BX
  mov BX, OFFSET ultTiro  ;endereço do vetor
  mov [BX], AL            ;Meu ult. tiro
  pop BX

  ;Atualiza vetor de status na posição 0 (soma tiro)
  call fSOMA_TIRO

  ;Busca resultado do ultimo tiro do oponente
  xor AX, AX
  mov BX, offset resultTiro
  mov AL, [BX]  
  
  ;Escreve resultado na PC0 
  OR AL, 01h ;Manda PC0 = 1 para saber que oponente devolveu resultado
  mov AH, 0CH  ;Escrita
  int 6FH      ; Escreve flags (PC3-PC2-PC1-PC0)

  ret
endp

fAGUARD_RESULTADO proc
  ;Verifica porta PC4, para ver se o oponente jogou
  call fAGUARD_OPONENTE

  ;Le porta C (PC7-PC6-PC5-PC4)
  mov  AH, 1CH
  int 6FH    ; Devolve flags no AL (PC7-PC6-PC5-PC4)
  mov BL, AL

  push AX
  ;Manda 0 para pc0 para oponente saber que estou apurando o resultado e jogando
  mov AH, 0CH  ;Escrita
  mov AL, 00H 
  int 6FH      ; Escreve flags (PC3-PC2-PC1-PC0)
  pop AX

  ; ------------------ACERTOU O TIRO ------------------
  ;Testa se PC5 = 1 para saber se acertou o tiro 
  and  BL, 02H
  jz  naoacertou

  ;Se acertou , soma acerto no vetor status posição 1 (soma acerto)
  call fSOMA_ACERTO
  ;Se acertou , pinta tiro no vetor de tiros.
  call fPINTA_ACERTO
  jmp continuaAf
  naoacertou:
    call fPINTA_ERRO


  continuaAf:
  ; ------------------AFUNDOU NAVIO ------------------
  ;Testa se PC6 = 1 para saber se afundou algum navio
  mov BL, AL
  and  BL, 04H
  jz  naoafundou

  ;Se afundou, soma no vetor status posição 2 (soma afundado).
  call fSOMA_AFUNDADO

  naoafundou:

  ; ------------------GANHOU JOGO ------------------
  ;Testa se PC7 = 1 para saber se ganhou o jogo
  mov BL, AL
  and  BL, 08H
  jz  naoganhou

  ;Se ganhou,Termina o jogo
  call fGANHOU_JOGO

  naoganhou:
  ret
endp

fAGUARD_OPONENTE proc
  push AX
  push BX
   
  xor AX, AX
  ;Loop para verificar quando oponente jogou
  Verif:
    call fSLEEP
    call fBEEP  
    ;Verifica PC4 = 1
    mov  AH, 1CH
    int 6FH    ; Devolve flags no AL (PC7-PC6-PC5-PC4)
    mov BL, AL
    ;shr BL, 4
    and  BL, 01H
    jnz  devolve
  jmp Verif
  
  devolve:
    pop BX
    pop AX
  ret
endp

fDEVOLVE_RESULTADO proc
  push BX
  push AX

  xor AX, AX
  xor BX, BX
  ;Le porta B (PB7..PB0)
  mov  AH, 0BH
  int 6FH    ; Devolve coord. no AL (PB7..PB4=LINHA --- PB3..PB0=COLUNA)
  
  call fAPURA_TIRO ;devolve flags na var resultTiro

  xor AX, AX
  mov BX, offset resultTiro
  mov AL, [BX]  
      
  AND AL, 08h
  jz naoperdeu 
  ;Se o jogo terminou mostrar a mensagem de derrota.
  call fPERDEU_JOGO

  naoperdeu:

  pop AX
  pop BX
  ret
endp

fLIMPA_TIRO proc    ; Limpa o nome da embarcação para poder escrever a próxima embarcação
  push DX

  mov DH, 15H;
  mov DL, 35H; 
  call POSICIONAR_CURSOR   
  mov  AH, 09H
  mov  DX, OFFSET lblBranco
  int  21H
  mov DH, 15H;
  mov DL, 35H; 
  call POSICIONAR_CURSOR
  pop  DX
  ret
endp

fGUARDA_TIRO_OP proc
  push AX
  push BX
  push CX
  push DX

  mov DH, 0DH
  mov DL, 47H
  call POSICIONAR_CURSOR
  
  XOR dx, dx
  mov DL, AL
  SHR DL, 4
  ADD DL, 30H
  call ESC_CHAR
  
  XOR dx, dx
  mov DL, AL
  SHl DL, 4
  SHr DL, 4
  ADD DL, 30H
  call ESC_CHAR
  
  pop DX
  pop CX
  pop BX
  pop AX
ret
endp

fSOMA_STATUS proc
  ;SOMA NO VETOR DE STATUS - Posição esta em DX
  push BX
  push AX

  mov BX, OFFSET vStatus  ;endereço do vetor
  add BX, DX
  mov AX, [BX]
  ADD AX, 01h ;SOMA UM
  MOV [BX], AX  ;Escreve

  pop AX 
  pop BX
  
  ret
endp

fSOMA_TIRO proc
  ;SOMA TIRO NO VETOR DE STATUS - Posição 0
  push DX
  push AX

  mov DX, 00H
  call fSOMA_STATUS

  pop AX
  pop DX
  
  ret
endp

fSOMA_TIRO_OPONENTE proc
  ;SOMA TIRO NO VETOR DE STATUS - Posição 3
  push DX
  push AX

  mov DX, 03H
  call fSOMA_STATUS

  pop AX
  pop DX
  
  ret
endp


fSOMA_ACERTO proc
  ;SOMA ACERTO NO VETOR DE STATUS - pos 1
  push DX
  push AX

  mov DX, 01H
  call fSOMA_STATUS

  pop AX
  pop DX
  
  ret
endp

fSOMA_ACERTO_OPONENTE proc
  ;SOMA ACERTO NO VETOR DE STATUS - pos 4
  push DX
  push AX

  mov DX, 04H
  call fSOMA_STATUS

  pop AX
  pop DX
  
  ret
endp

fSOMA_AFUNDADO proc
  ;SOMA AFUNDADO NO VETOR DE STATUS - pos 2
  push DX
  push AX

  mov DX, 02H
  call fSOMA_STATUS

  pop AX
  pop DX

  ret
endp

fSOMA_AFUNDADO_OPONENTE proc
  ;SOMA AFUNDADO NO VETOR DE STATUS - pos 5
  push DX
  push AX

  mov DX, 05H
  call fSOMA_STATUS

  pop AX
  pop DX

  ret
endp

fLE_TIRO proc
  call fLIMPA_TIRO
  mov  DX, OFFSET lblLinCol
  int  21H

  call LE_LINHA_COLUNA
  xor AX, AX

  mov  AL, PosLinha    ; Linha
  shl  AL, 4
  add  AL, PosColuna    ; Coluna
  
  ret
endp 


fESCREVE_STATUS proc
  ;End da string deve estar em DX
  push DX

  ;Limpa msg anterior    
  mov DH, 11H;
  mov DL, 12H; 
  call POSICIONAR_CURSOR

  push DX 
  mov  AH, 09H
  mov  DX, OFFSET lblBrancoGrande
  int  21H
  pop DX

  call POSICIONAR_CURSOR
  ;Imprime msg
  pop DX  
  int  21H

  ret
endp  

fSLEEP proc ;1 segundo
  push AX
  push BX
  push CX


  mov AH, 2Ch
  int 21h
  mov BH, DH

  segund:
    int 21h
    cmp BH, DH
    jnz passou
    jmp segund

  passou:
    
  pop CX
  pop BX
  pop AX

  ret
endp

fGANHOU_JOGO proc
  mov  DX, OFFSET lblMsgGanho
  call fESCREVE_STATUS

  jmp FIMDEJOGO

  ret
endp

fPERDEU_JOGO proc
  mov  DX, OFFSET lblMsgPerde
  call fESCREVE_STATUS

  jmp FIMDEJOGO

  ret
endp

fBUSCA_ULT_TIRO proc
  ;BUSCA MEU ULTIMO TIRO
  push BX
  xor AX, AX
  mov BX, OFFSET ultTiro  ;endereço da var
  mov AL, [BX]            ;Meu ult. tiro
  pop BX
  ret
endp

fATUALIZA_PLACAR proc
  push DX
  ;Atualiza placar com dados do vetor de status - escreve na tela 
  mov BX, OFFSET vStatus  ;endereço do vetor
  mov DH, 03H ; //Lin inicial
  mov DL, 48H ; //Coluna
  mov DI, 00h
  escreve:
    add DH, 01h
    call POSICIONAR_CURSOR
    push DX
    mov  AH, 09H
    mov  DX, OFFSET lblBrancoPequeno
    int  21H
    
    pop DX
    call POSICIONAR_CURSOR
    xor AX, AX
    mov  AL, [BX + DI]
    call ESC_INT
    
    INC DI
    cmp DI, 03H
    jz pulalinhas

    cmp DI, 06H
    jz acabou
    
    jmp escreve

    pulalinhas:
      ADD DH, 03h
      jmp escreve 

  acabou:

  pop DX  
  ret
endp

fPINTA proc
  call fBUSCA_ULT_TIRO
  mov  DH, AL    ; Linha
  shr  DH, 4
  mov  DL, AL    ; Coluna
  and  DL, 0Fh
  shl  DL, 1
  add  DL, 04h
  add  DH, 04h
  call POSICIONAR_CURSOR
  ret
endp

fPINTA_ACERTO proc  
  push AX

  call fPINTA
  mov  DH, 02h   
  mov  DL, 88
  call ESC_CHAR_COLORIDO

  pop AX
  ret
endp

fPINTA_ERRO proc
  push AX

  call fPINTA
  mov  DH, 04h    
  mov  DL, 254
  call ESC_CHAR_COLORIDO

  pop AX
  ret
endp

fMARCA_NAVIO proc
  ;Marca que tiro foi dado na minha matriz de navios - ;Posição do tiro esta em AL
  push BX
  push DX
  push CX

  mov BX, offset resultTiro
  mov byte ptr [BX], 01h    ;JOGOU PC0 = 1

  mov  DH, AL    ; Linha
  shr  DH, 4
  mov  DL, AL    ; Coluna
  and  DL, 0Fh
  push AX
  call POS_OCUPADA
  cmp  AL, 0
  mov cx, ax
  pop AX
  jnz  ACERTOU_TIRO

  mov  AL, 254
  jmp MARCA_TIRO
  
ACERTOU_TIRO:
  push AX
  call POS_ACERTADA
  cmp AL, 0

  pop AX
  jnz RES_MARCA

  ;PC1 - ACERTOU O TIRO
  mov BX, offset resultTiro
  add byte ptr [BX], 02H
  call fSOMA_ACERTO_OPONENTE
  mov  AL, CL  
  call fVERIFICA_AFUNDADO ;Tipo do navio esta em AL   
MARCA_TIRO :
  shl  DL, 1
  add  DL, 1Dh
  add  DH, 04h
  call POSICIONAR_CURSOR
  mov  DH, 04h    ;//temp - ou colocar 0Ch
  mov  DL, AL
  call ESC_CHAR_COLORIDO  
RES_MARCA:
  pop CX
  pop DX
  pop BX
  ret
endp


fAPURA_TIRO proc 
  ;COORDENADA DO TIRO ESTA EM AL

  call fSOMA_TIRO_OPONENTE ;Soma tiro do oponente no status
  call fMARCA_NAVIO ;pinta de verm. na matriz de navios tiro do oponente - tiro esta em AL - Verifica acertou, afundou, perdeu...

  ret
endp

POS_ACERTADA proc
  push DX
  push CX
  push BX
  
  xor AH, AH
  mov  BX, OFFSET vPosAcertada
  add BX, AX
  
  cmp  [BX], BYTE PTR 00h
  jnz   EXISTE

  mov [BX], BYTE PTR 01H
  mov  AL, 0
  jmp  RET_AC
EXISTE:
  mov  AL, 1

RET_AC:
  pop  BX
  pop  CX
  pop  DX
  ret
endp

fVERIFICA_AFUNDADO proc
  push AX

  ;VERIFICAR SE NAVIO FOI AFUNDADO E SE TODOS FORAM AFUNDADOS - TIPO DO NAVIO ESTA EM AL
  mov  BL, constLetAvioes
  cmp  AL, BL
  jz   acertou_a
  mov  BL, constLetNavio
  cmp  AL, BL
  jz   acertou_n
  mov  BL, constLetSubmari
  cmp  AL, BL
  jz   acertou_s
  mov  BL, constLetDestro
  cmp  AL, BL
  jz   acertou_d
  mov  BL, constLetBarco
  cmp  AL, BL
  jz   acertou_b

  jmp sair_r

  acertou_a:
    mov BX, offset vContAvioes
    mov CL, 05H
    jmp acerto_s
  acertou_n:
    mov BX, offset vContNavio
    mov CL, 04H
    jmp acerto_s
  acertou_s:
    mov BX, offset vContSubmari
    mov CL, 03H
    jmp acerto_s
  acertou_d:
    mov BX, offset vContDestro
    mov CL, 03h
    jmp acerto_s
  acertou_b:
    mov BX, offset vContBarco
    mov CL, 02H
    jmp acerto_s

  acerto_s:
    inc byte ptr [BX]
    cmp [BX], CL
    jnz finals
    inc byte ptr [BX + 01H]        
    ;Se afundou - PC2 = 1 AFUNDOU NAVIO
    call fSOMA_AFUNDADO_OPONENTE
    mov BX, offset resultTiro
    add byte ptr [BX], 04H

  sair_r:
    ;Se o adversário ganhou - afundou todos os meus navios - MANDA 1 NA PC3
    xor DI, DI
    mov al, 01h
    mov BX, offset vContAvioes
    call AFUNDADO
    mov BX, offset vContNavio
    call AFUNDADO
    mov BX, offset vContSubmari
    call AFUNDADO
    mov BX, offset vContDestro
    call AFUNDADO
    mov BX, offset vContBarco
    call AFUNDADO

    mov AX, 05H 
    cmp DI,AX 
    jnz finals
    mov BX, offset resultTiro
    add byte ptr [BX], 08H
  finals:
    pop AX
  ret
endp

fBEEP proc
 push AX
 push DX
 push BX
 
  xor AX, AX
  xor DX, DX

  mov AH, 02H
  mov DL, 7h
  int 21H

  pop BX
  pop DX
  pop AX
  ret
endp

AFUNDADO proc
  cmp [BX + 01h], AL
  jnz nao_af
  inc DI

nao_af:
  ret
endp

inicio:
  mov  AX, @DATA
  mov  DS, AX

  DEFINE_PPA_INT  ;Cria interrupção da PPA

  ; Define modo de operação da porta
  mov  AL, 8Ah    ; Modo (PA=Saida, PB=Entrada, PCH=Entrada, PCL=Saída)  
  mov  AH, 0Dh
  int 6FH

  ; Monta tela do jogo
  comeca_jogo:
  call LIMPA_TELA
  call HABILITA_COR
  DESENHAR_TELA_INICIAL
  LE_EMBARCACOES  ;Pede a localização das embarcações

  call LIMPA_TELA
  call HABILITA_COR
  DESENHAR_TELA_JOGO
  ESC_MATRIZ_NAVIO

;Define sempre que é sua vez
AGJOGADA:
  mov  DX, OFFSET lblStaJogando ;Jogando
  call fESCREVE_STATUS
  call fAGUARD_JOGADA
  jmp  AGRESULTADO

  AGRESULTADO:
    mov  DX, OFFSET lblStaAguaOpo ;Aguardando oponente
    call fESCREVE_STATUS
    call fAGUARD_RESULTADO
    jmp COMPUTA_TIRO_OP

  COMPUTA_TIRO_OP:
    call fDEVOLVE_RESULTADO
    call fATUALIZA_PLACAR

  jmp AGJOGADA


FIMDEJOGO:
  call fATUALIZA_PLACAR
  call fSLEEP
  call fSLEEP
  call fSLEEP
  call LIMPA_TELA
  
  mov  AH, 07    ; espera o pressionamento de uma tecla
  int  21h

SAIR:
  mov  AH, 4Ch; termina o programa
  int  21h

end inicio