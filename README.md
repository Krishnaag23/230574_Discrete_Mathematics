
# Discrete Mathematics Assignments Repository

This repository contains my submissions for the assignments given in the Discrete Mathematics project under the STAMATICS society.

## Directory Structure

The repository is structured as follows:

- **Assignment1/**: Contains the submission for Assignment 1.
- **Assignment2/**: Contains the submission for Assignment 2.

Each directory includes the necessary files and documentation related to their respective assignments.

## Assignment 2 Details

### Lexical Analyzer for "Kanpur" Programming Language

In the `Assignment2` directory, you will find an implementation of a lexical analyzer (scanner) for the "Kanpur" programming language using Flex. The directory includes:
- **probl1.l**: Flex specification file for the lexical analyzer.
- **public1.knp, public2.knp, public3.knp, public4.knp**: Sample Kanpur programs to test the lexical analyzer.

### Usage Instructions

To compile and run the lexical analyzer, follow these steps:
1. Navigate to the `Assignment2` directory.
2. Run the following commands:
   ```sh
   flex probl1.l
   gcc lex.yy.c -o prob1 -lfl
   ./prob1 public1.knp
