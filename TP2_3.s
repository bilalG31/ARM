.global _start
tab: .int 9, -4, 27592, 0, -95260, 9, -4, 27592, 0, -27592
        .align

_start:
  mov r5, #0 @indice du max
  mov r6, #0 @max
  adr r9, tab
  mov r1, #1 @i
  ldr r6, [r9]

boucle:
  cmp r1, #10
  beq _exit
  ldr r2, [r9, r1, lsl #2]
  cmp r2, r6
  ble finsi
  mov r5, r1
  mov r6, r2


finsi:
  add r1, r1, #1
  b boucle

_exit:
  mov r10, #0
  mov r10, #0
