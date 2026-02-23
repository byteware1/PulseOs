.section .text
.global _start
_start:
    call kernel_main
    hlt_loop:
        hlt
        jmp hlt_loop