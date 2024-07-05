# Assignment 2

### Description
This repository contains two directories, Assignment 1 and Assignment 2, which are my submissions for the respective assignments given in the Discrete Mathematics project under the STAMATICS society.

### Assignment 2
This directory contains the implementation of a lexical analyzer (scanner) for the "Kanpur" programming language using Flex.

#### Files
- **probl1.l**: The Flex specification file containing the lexical analyzer code.
- **public1.knp, public2.knp, public3.knp, public4.knp**: Sample Kanpur programs to test the lexical analyzer.

### Usage

#### Prerequisites
- Flex
- GCC

#### Steps
Navigate to the `assignment2` directory.  
Run the following commands to compile and run the lexical analyzer:
```sh
flex probl1.l
gcc lex.yy.c -o prob1 -lfl
./prob1 public1.knp
```
Replace `public1.knp` with your own Kanpur source file if needed.

#### Output
The lexical analyzer will output a list of unique lexemes classified into proper syntactic categories and sorted by lexeme.
