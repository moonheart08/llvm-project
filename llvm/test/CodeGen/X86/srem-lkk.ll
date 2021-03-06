; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown | FileCheck %s --check-prefix=CHECK

define i32 @fold_srem_positive_odd(i32 %x) {
; CHECK-LABEL: fold_srem_positive_odd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movslq %edi, %rax
; CHECK-NEXT:    imulq $-1401515643, %rax, %rcx # imm = 0xAC769185
; CHECK-NEXT:    shrq $32, %rcx
; CHECK-NEXT:    addl %eax, %ecx
; CHECK-NEXT:    movl %ecx, %edx
; CHECK-NEXT:    shrl $31, %edx
; CHECK-NEXT:    sarl $6, %ecx
; CHECK-NEXT:    addl %edx, %ecx
; CHECK-NEXT:    imull $95, %ecx, %ecx
; CHECK-NEXT:    subl %ecx, %eax
; CHECK-NEXT:    # kill: def $eax killed $eax killed $rax
; CHECK-NEXT:    retq
  %1 = srem i32 %x, 95
  ret i32 %1
}


define i32 @fold_srem_positive_even(i32 %x) {
; CHECK-LABEL: fold_srem_positive_even:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movslq %edi, %rax
; CHECK-NEXT:    imulq $1037275121, %rax, %rcx # imm = 0x3DD38FF1
; CHECK-NEXT:    movq %rcx, %rdx
; CHECK-NEXT:    shrq $63, %rdx
; CHECK-NEXT:    sarq $40, %rcx
; CHECK-NEXT:    addl %edx, %ecx
; CHECK-NEXT:    imull $1060, %ecx, %ecx # imm = 0x424
; CHECK-NEXT:    subl %ecx, %eax
; CHECK-NEXT:    # kill: def $eax killed $eax killed $rax
; CHECK-NEXT:    retq
  %1 = srem i32 %x, 1060
  ret i32 %1
}


define i32 @fold_srem_negative_odd(i32 %x) {
; CHECK-LABEL: fold_srem_negative_odd:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movslq %edi, %rax
; CHECK-NEXT:    imulq $-1520762971, %rax, %rcx # imm = 0xA55AFFA5
; CHECK-NEXT:    movq %rcx, %rdx
; CHECK-NEXT:    shrq $63, %rdx
; CHECK-NEXT:    sarq $40, %rcx
; CHECK-NEXT:    addl %edx, %ecx
; CHECK-NEXT:    imull $-723, %ecx, %ecx # imm = 0xFD2D
; CHECK-NEXT:    subl %ecx, %eax
; CHECK-NEXT:    # kill: def $eax killed $eax killed $rax
; CHECK-NEXT:    retq
  %1 = srem i32 %x, -723
  ret i32 %1
}


define i32 @fold_srem_negative_even(i32 %x) {
; CHECK-LABEL: fold_srem_negative_even:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movslq %edi, %rax
; CHECK-NEXT:    imulq $-47844377, %rax, %rcx # imm = 0xFD25F3E7
; CHECK-NEXT:    movq %rcx, %rdx
; CHECK-NEXT:    shrq $63, %rdx
; CHECK-NEXT:    sarq $40, %rcx
; CHECK-NEXT:    addl %edx, %ecx
; CHECK-NEXT:    imull $-22981, %ecx, %ecx # imm = 0xA63B
; CHECK-NEXT:    subl %ecx, %eax
; CHECK-NEXT:    # kill: def $eax killed $eax killed $rax
; CHECK-NEXT:    retq
  %1 = srem i32 %x, -22981
  ret i32 %1
}


; Don't fold if we can combine srem with sdiv.
define i32 @combine_srem_sdiv(i32 %x) {
; CHECK-LABEL: combine_srem_sdiv:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movslq %edi, %rax
; CHECK-NEXT:    imulq $-1401515643, %rax, %rcx # imm = 0xAC769185
; CHECK-NEXT:    shrq $32, %rcx
; CHECK-NEXT:    addl %eax, %ecx
; CHECK-NEXT:    movl %ecx, %edx
; CHECK-NEXT:    shrl $31, %edx
; CHECK-NEXT:    sarl $6, %ecx
; CHECK-NEXT:    addl %edx, %ecx
; CHECK-NEXT:    imull $95, %ecx, %edx
; CHECK-NEXT:    subl %edx, %eax
; CHECK-NEXT:    addl %ecx, %eax
; CHECK-NEXT:    # kill: def $eax killed $eax killed $rax
; CHECK-NEXT:    retq
  %1 = srem i32 %x, 95
  %2 = sdiv i32 %x, 95
  %3 = add i32 %1, %2
  ret i32 %3
}

; Don't fold for divisors that are a power of two.
define i32 @dont_fold_srem_power_of_two(i32 %x) {
; CHECK-LABEL: dont_fold_srem_power_of_two:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movl %edi, %eax
; CHECK-NEXT:    leal 63(%rax), %ecx
; CHECK-NEXT:    testl %edi, %edi
; CHECK-NEXT:    cmovnsl %edi, %ecx
; CHECK-NEXT:    andl $-64, %ecx
; CHECK-NEXT:    subl %ecx, %eax
; CHECK-NEXT:    # kill: def $eax killed $eax killed $rax
; CHECK-NEXT:    retq
  %1 = srem i32 %x, 64
  ret i32 %1
}

; Don't fold if the divisor is one.
define i32 @dont_fold_srem_one(i32 %x) {
; CHECK-LABEL: dont_fold_srem_one:
; CHECK:       # %bb.0:
; CHECK-NEXT:    xorl %eax, %eax
; CHECK-NEXT:    retq
  %1 = srem i32 %x, 1
  ret i32 %1
}

; Don't fold if the divisor is 2^31.
define i32 @dont_fold_srem_i32_smax(i32 %x) {
; CHECK-LABEL: dont_fold_srem_i32_smax:
; CHECK:       # %bb.0:
; CHECK-NEXT:    # kill: def $edi killed $edi def $rdi
; CHECK-NEXT:    leal 2147483647(%rdi), %eax
; CHECK-NEXT:    testl %edi, %edi
; CHECK-NEXT:    cmovnsl %edi, %eax
; CHECK-NEXT:    andl $-2147483648, %eax # imm = 0x80000000
; CHECK-NEXT:    addl %edi, %eax
; CHECK-NEXT:    retq
  %1 = srem i32 %x, 2147483648
  ret i32 %1
}

; Don't fold i64 srem
define i64 @dont_fold_srem_i64(i64 %x) {
; CHECK-LABEL: dont_fold_srem_i64:
; CHECK:       # %bb.0:
; CHECK-NEXT:    movabsq $6023426636313322977, %rcx # imm = 0x5397829CBC14E5E1
; CHECK-NEXT:    movq %rdi, %rax
; CHECK-NEXT:    imulq %rcx
; CHECK-NEXT:    movq %rdx, %rax
; CHECK-NEXT:    shrq $63, %rax
; CHECK-NEXT:    sarq $5, %rdx
; CHECK-NEXT:    addq %rax, %rdx
; CHECK-NEXT:    imulq $98, %rdx, %rax
; CHECK-NEXT:    subq %rax, %rdi
; CHECK-NEXT:    movq %rdi, %rax
; CHECK-NEXT:    retq
  %1 = srem i64 %x, 98
  ret i64 %1
}
