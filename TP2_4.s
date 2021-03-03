.global _start

MAT: .int 5, 6, 3, 2
_start:


mov r0,#1
mov r1,#1
mov r2,#2
mov r5,#0

mla r3,r0,r2,r1
adr r4, MAT
str r5,[r4,r3,LSL #2]

_exit:
  mov r10, r10
  mov r10, r10
