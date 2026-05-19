# ============================================================
# RISC-V Assembly Program - Pipeline Hazard Observation
# Group 7 | COA Micro Project | PBCST404
# Vidya Academy of Science and Technology
# ============================================================
# PURPOSE:
#   This program demonstrates the effect of data hazards
#   in a 5-stage RISC-V pipeline WITHOUT forwarding or
#   hazard detection mechanisms (simulated in Ripes).
#
# OBSERVATION:
#   Due to missing hazard handling, the pipeline reads
#   stale register values, causing incorrect execution.
#   The branch at 'beq' always jumps to 'wrong', triggering
#   an invalid ecall (999) instead of the exit call (10).
# ============================================================

.data
val: .word 10           # Integer value stored in memory

.text
.globl main
main:
    la x5, val          # Load address of val into x5
    lw x17, 0(x5)       # Load word at address x5 into x17
    add x17, x17, x0    # x17 = x17 + x0 (x0 is always zero)
    add x17, x17, x0    # x17 = x17 + x0 (repeated to observe hazard)
    beq x17, x17, wrong # Branch always taken to 'wrong' label
    addi x17, x0, 10    # Load exit syscall number (never reached)
    ecall               # Exit system call (never reached)

wrong:
    addi x17, x0, 999   # Incorrect system call number (hazard effect)
    ecall               # Triggers error due to invalid ecall number

# ============================================================
# EXPECTED vs ACTUAL BEHAVIOR:
#   Expected : x17 = 10, ecall 10 (exit) executes normally
#   Actual   : x17 = stale/incorrect value due to data hazard
#              Branch misbehaves → ecall 999 → system call error
# ============================================================
