; 10 SYS (16384)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $31, $36, $33, $38, $34, $29, $00, $00, $00



*=$4000

  ;go into 24 row mode
  lda #%11110111
  and $d011
  sta $d011

  ;clear screen
  lda #$20 ;space character
  ldx #$00
clrscr_loop
  sta $400,x
  sta $500,x
  inx
  bne clrscr_loop
  
  ;wait for a key press
wait_key
  jsr $ffe4
  beq wait_key

  ;go into 25 row mode
  lda #%00001000
  ora $d011
  sta $d011


