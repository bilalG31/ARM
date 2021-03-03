.global _start

qmois: .int 0,31,59,90,120,151,181,212,243,273,304,334

@ Prend un numéro de mois dans r3
@ Renvoie dans r0 le quantieme du jour dans le mois
DEBUT:  stmfd sp!,{r1,r3}
        adr r1,qmois
        sub r3,r3,#1
        ldr r0,[r1,r3,LSL #2]
        ldmfd sp!,{r1,r3}
        mov pc,lr


@ Prend dans r5 le dividende et r6 le diviseur
@ Renvoie dans r0 1 si divisible, 0 sinon
DIVISIBLE:  stmfd sp!,{r5}
bcl:        cmp r5,#0
            beq oui
            blt non
            subhi r5,r5,r6
            b bcl
oui:        mov r0,#1
            b fin
non:        mov r0,#0
            b fin

fin:        ldmfd sp!,{r5}
            mov pc,lr


@ Prend dans r5 un numéro d'année
@ Renvoie dans r0 1 si l'année est bissextile, 0 sinon
BISSEXTILE: stmfd sp!,{r6,lr}
            mov r6,#4
            bl DIVISIBLE @ r0 contient maintenant le resultat
            cmp r0,#1
            bne nonbi
            mov r6,#100
            bl DIVISIBLE
            cmp r0,#1
            beq nonbi
            mov r6,#400
            bl DIVISIBLE
            cmp r0,#1
            beq bi
            mov r0,#1
            b fin
bi:         mov r0,#1
            b finbi
nonbi:      mov r0,#0
finbi:      ldmfd sp!,{r6,pc}



_start: mov r1,#31 @ num jour
        mov r3,#12 @ num mois
        mov r5,#2000 @ num an
        bl DEBUT  @ r0 contient maintenant le quantieme
        add r7,r0,r1 @ r7 contient le quantieme
        bl BISSEXTILE
        cmp r0,#1
        bne _exit
        cmp r3,#2
        addhi r7,r7,#1 @ r7 contient le quantieme pour une année bissextile
        b _exit

_exit: b _exit
