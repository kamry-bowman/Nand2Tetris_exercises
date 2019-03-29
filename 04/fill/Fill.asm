// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
  @on
  M=0;
  M=D
(LOOP)
  @KBD
  D=M
  @HANDLEOFF
  D;JEQ   // handleoff subroutine if KBD == 0
(HANDLEON)
  @on
  D=M
  @LOOP
  D;JGT // if screen is already on, goto LOOP
  @8191
  D=A
  @i
  M=D
(ONPAINTLOOP)
  @on
  M=1;
  @i
  D=M
  @LOOP
  D;JEQ
  @SCREEN
  A=D+A   //i+KBD_index, saving address
  M=-1     //set memory at i+KBD_index off
  @i
  M=M-1;  // i = i-1
  @ONPAINTLOOP
  0;JMP
(HANDLEOFF)
  @on
  D=M
  @LOOP
  D;JEQ // if screen is already off, goto LOOP
  @8191
  D=A
  @i
  M=D
(OFFPAINTLOOP)
  @on
  M=0;
  @i
  D=M
  @LOOP
  D;JEQ
  @SCREEN
  A=D+A   //i+KBD_index, saving address
  M=0     //set memory at i+KBD_index off
  @i
  M=M-1;  // i = i-1
  @OFFPAINTLOOP
  0;JMP
