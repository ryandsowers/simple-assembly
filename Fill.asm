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

(DISPLAY_LOOP)
	@SCREEN
	D=A
	@addr
	M=D 		//addr=16384 (first word of screen)

	@24575
	D=A
	@end
	M=D 		//end=24575 (last word of screen)

(COLOR_LOOP)
	@addr
	D=M
	@end
	D=D-M
	@DISPLAY_LOOP
	D;JGT 		//if addr>end goto DISPLAY_LOOP
	
	@KBD
	D=M
	@WHITE
	D;JEQ 		//if kbd=0, goto WHITE

(BLACK)
	@addr
	A=M
	M=-1 		//RAM[addr]=1111 1111 1111 1111
	@INC
	0;JMP 		//go to INCrementer

(WHITE)
	@addr
	A=M
	M=0 		//RAM[addr]=0000 0000 0000 0000
	
(INC)
	@addr
	M=M+1 		//addr=addr+1
	@COLOR_LOOP
	0;JMP 		//goto COLOR_LOOP

(END)
	@END
	0;JMP
