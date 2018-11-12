// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Put your code here.

	@R2	//initialize
	M=0

(LOOP)
		
	@R0
	D=M

	@END
	D;JEQ	//condition - if first number is zero, exit loop, finished
			
	@R1
	D=M
	@R2
	M=D+M	//otherwise, add second number to total

	@R0
	M=M-1	//reduce first number by one

	@LOOP
	0;JMP
(END)

	@END
	0;JMP