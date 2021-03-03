.global _start
chaine: .asciz "Hahahah"
        .align

_start:
  adr r9, chaine
  mov r1, #0

boucle:
  ldrb r2, [r9, r1]
  cmp r2, #0
  beq _exit
  cmp r2, #'a'
  blo finsi
  cmp r2, #'z'
  bhi finsi
  sub r2, r2, #32
  strb r2, [r9,r1]
finsi:
  add r1, r1, #1
  b boucle

_exit:
  mov r10, #0
  mov r10, #0
