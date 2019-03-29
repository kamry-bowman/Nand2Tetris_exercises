// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.
  @R2
  M=0
  @i
  M=1
  @total
  M=0
(LOOP)
  @i
  D=M
  @R1
  D=M-D
  @POSTLOOP
  D;JLT // Exit Loop if R1-i == 0
  @R0
  D=M     // D=@R0
  @total
  M=D+M   // total = total + @R0
  @i
  M=M+1
  @LOOP
  0;JMP
(POSTLOOP)
  @total
  D=M
  @R2
  M=D
(END)
  @END
  0;JMP

