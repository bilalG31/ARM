.global _start
tab: .int 9, -4, 27592, 0, -27592, 9, -4, 27592, 0, -27592
_start:

mov r4,#0
mov r2,#0

adr r1,tab
bcl:
cmp r4,#10
bhs _exit

ldr r0,[r1,r4,lsl#2]
bl abs


add r4,r4,#1
add r2,r2,r1

b bcl

_exit:
b _exit


abs:
mov r1,r0
cmp r0,#0
rsblt r1,r0,#0
mov pc,r14
