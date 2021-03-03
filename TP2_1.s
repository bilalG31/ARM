.global _start
operateur: .byte '*'
.align
_start:
  adr r9, operateur
  ldr r0, [r9]
  mov r1, #2
  mov r2, #3
  cmp r0, #'+'
  addeq r3, r1, r2
  cmp r0, #'-'
  subeq r3, r1, r2
  cmp r0, #'*'
  muleq r3, r1, r2
_exit:
  mov r10, #0
  mov r10, #0
