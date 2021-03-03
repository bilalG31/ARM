.global _start

.equ PIOB_BASE, 0xFFFFF600
.equ PIO_PER, 0
.equ PIO_OER, 0x10
.equ PIO_ODR, 0x14
.equ PIO_SODR, 0x30
.equ PIO_CODR, 0x34
.equ PIO_PDSR, 0x3C
.equ LED, 1<<27
.equ SW1, 1<<24

_start :
        MOV R6, #5
        LDR R12,= PIOB_BASE
        MOV R0, #LED | SW1
        STR R0,[R12, #PIO_PER]
        MOV R0, #SW1
        STR R0, [R12, #PIO_ODR]
        MOV R0, #LED
        STR R0, [R12, #PIO_OER]
        STR R0, [R12, #PIO_CODR]

EA :    LDR R0, [R12, #PIO_PDSR]
        TST R0, #SW1
        BEQ fin
        MOV R0, #LED
        STR R0,[R12, #PIO_CODR]
        BL ATTENDRE
        STR R0, [R12, #PIO_SODR]
        BL ATTENDRE
        B EA
fin :

_exit : b _exit

ATTENDRE :            MOV R2, #0
          while1 :    CMP R2, R6
                      BEQ fin_while1
                      MOV R3, #0
          while2 :    CMP R3, #0x20000
                      ADDEQ R2, R2, #1
                      BEQ while1
                      ADD R3, R3, #1
                      B while2
          fin_while1: MOV pc, lr
