%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define MAX_LEXEMES 1000

typedef struct {
    char *lexeme;
    char *token;
    int count;
} LexemeInfo;

LexemeInfo lexemes[MAX_LEXEMES];
int lexemeCount = 0;

int findLexeme(char *lexeme, char *token) {
    for (int i = 0; i < lexemeCount; i++) {
        if (strcmp(lexemes[i].lexeme, lexeme) == 0 && strcmp(lexemes[i].token, token) == 0) {
            return i;
        }
    }
    return -1;
}

void addLexeme(char *lexeme, char *token) {
    int index = findLexeme(lexeme, token);
    if (index == -1) {
        lexemes[lexemeCount].lexeme = strdup(lexeme);
        lexemes[lexemeCount].token = strdup(token);
        lexemes[lexemeCount].count = 1;
        lexemeCount++;
    } else {
        lexemes[index].count++;
    }
}

int compareLexemes(const void *a, const void *b) {
    LexemeInfo *lexA = (LexemeInfo *)a;
    LexemeInfo *lexB = (LexemeInfo *)b;
    return strcmp(lexA->lexeme, lexB->lexeme);
}

void printLexemes() {
    qsort(lexemes, lexemeCount, sizeof(LexemeInfo), compareLexemes);
    printf("TOKEN COUNT LEXEME\n");
    for (int i = 0; i < lexemeCount; i++) {
        printf("%s %d %s\n", lexemes[i].token, lexemes[i].count, lexemes[i].lexeme);
    }
}
%}

%x COMMENT

%%
"/*"                   { BEGIN(COMMENT); }
<COMMENT>"*/"          { BEGIN(INITIAL); }
<COMMENT>.             { /* Consume comment */ }
<COMMENT>\n            { /* Consume comment */ }

\"([^\\\"]|\\.)*\"      { addLexeme(yytext, "STRING"); }
\'([^\\\']|\\.)*\'      { addLexeme(yytext, "STRING"); }

"ARRAY"|"BEGIN"|"BOOLEAN"|"COMMENT"|"CONTINUE"|"DO"|"DOUBLE"|"ELSE"|"END"|"FALSE"|"FOR"|"IF"|"INTEGER"|"LABEL"|"LIST"|"LONG"|"OWN"|"PROCEDURE"|"STEP"|"SWITCH"|"THEN"|"TRUE"|"UNTIL"|"VALUE"|"WHILE" {
                        addLexeme(yytext, "KEYWORD"); }
"AND"|"OR"|"LEQ"|"LT"|"GEQ"|"GT"|"NOT"|"EQL"|"NEQ"|":="|"+"|"-"|"*"|"/"|"%"|"^"|"|"|"&"|"«"|"»"|"<="|">=" {
                        addLexeme(yytext, "OPERATOR"); }
[A-Za-z][A-Za-z0-9]*    { addLexeme(yytext, "IDENTIFIER"); }
";"|":"|","|"\'"|"("|")"|"\""|"["|"]"|"{"|"}" {
                        addLexeme(yytext, "DELIMITER"); }
[0-9]+                 { addLexeme(yytext, "INTEGER"); }
[ \t\r\f\v\n]+         { /* Consume whitespace */ }
.                      { /* Consume unknown characters */ }

%%

int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror(argv[1]);
            return 1;
        }
        yyin = file;
    }
    yylex();
    printLexemes();
    return 0;
}

int yywrap() {
    return 1;
}
