%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern FILE *yyin;
FILE *outputFile;

// Function declarations to prevent implicit declaration warnings
int yylex(void);
void yyerror(char *);

// Utility functions
int labelCount = 0;
int tempCount = 0;

char* newLabel() {
    static char label[10];
    sprintf(label, "L%d", labelCount++);
    return strdup(label);
}

char* newTemp() {
    static char temp[10];
    sprintf(temp, "t%d", tempCount++);
    return strdup(temp);
}

void emit(char *s) {
    fprintf(outputFile, "%s\n", s);
}
%}

/* YYSTYPE types */
%union {
    int num;
    char* id;
}

/* Declare tokens */
%token POGUES KOOKS JOHNB SARAHS WARD TOPPER CLEO RILEY KIARA SIMON TEAGUE POPE JJ BEAUMONT HIGHWRECK MAP TREASURE SEARCH DIVE GOLD SHIPWRECK STORM ISLAND TIDE CURRENT ANCHOR ROPE SALVAGE SCRAP CODEBOOK MEMBER LOCK KEY HIDEOUT STASH CACHE LOOT TRADE SIGNAL RADIO LISTEN MESSAGE ROUTE CHARTED UNLOCKED BURIED HIGHWATER
%token <id> ID STRING
%token <num> NUMBER

/* Comparison operators */
%token LTE GTE EQ NEQ

/* Non-terminal types */
%type <id> expr condition

/* Precedence & associativity */
%left TEAGUE POPE
%left '+' '-'
%left '*' '/'
%nonassoc UMINUS

%start program

%%

program:
    POGUES HIDEOUT statements HIDEOUT {
        printf("Parsing complete.\n");
    }
    ;

statements:
    /* empty */
    | statements statement
    ;

statement:
    JJ ID ';' {
        // Variable declaration
    }
    | CLEO JJ ID '=' NUMBER ';' {
        char *t = newTemp();
        fprintf(outputFile, "%s = %d\n", t, $5);
        fprintf(outputFile, "%s = %s\n", $3, t);
    }
    | TREASURE ID '=' expr ';' {
        fprintf(outputFile, "%s = %s\n", $2, $4);
    }
    | WARD '(' condition ')' HIDEOUT statements HIDEOUT {
        char *endLabel = $3;
        fprintf(outputFile, "%s:\n", endLabel);
    }
    | TOPPER HIDEOUT statements HIDEOUT {
        printf("Else block\n");
    }
    | SEARCH ID HIDEOUT statements HIDEOUT {
        // Function definition
        fprintf(outputFile, "%s:\n", $2);
        fprintf(outputFile, "return\n");
    }
    | DIVE ID '(' ')' ';' {
        // Function call with no arguments
        fprintf(outputFile, "call %s, 0\n", $2);
    }
    | TRADE '(' STRING ')' ';' {
        // Print string literal
        char *temp = newTemp();
        fprintf(outputFile, "%s = \"%s\"\n", temp, $3);
        fprintf(outputFile, "param %s\n", temp);
        fprintf(outputFile, "call PRINT_STRING, 1\n");
    }
    | TRADE '(' ID ')' ';' {
        // Print variable
        char *temp = newTemp();
        fprintf(outputFile, "%s = %s\n", temp, $3);
        fprintf(outputFile, "param %s\n", temp);
        fprintf(outputFile, "call PRINT, 1\n");
    }
    | LOOT '(' STRING ')' ';' {
        // Alternate print string
        char *temp = newTemp();
        fprintf(outputFile, "%s = \"%s\"\n", temp, $3);
        fprintf(outputFile, "param %s\n", temp);
        fprintf(outputFile, "call PRINT_STRING, 1\n");
    }
    | LOOT '(' ID ')' ';' {
        // Alternate print variable
        char *temp = newTemp();
        fprintf(outputFile, "%s = %s\n", temp, $3);
        fprintf(outputFile, "param %s\n", temp);
        fprintf(outputFile, "call PRINT, 1\n");
    }
    ;

expr:
    ID {
        $$ = strdup($1);
    }
    | NUMBER {
        char *t = newTemp();
        fprintf(outputFile, "%s = %d\n", t, $1);
        $$ = t;
    }
    | expr '+' expr {
        char *t = newTemp();
        fprintf(outputFile, "%s = %s + %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '-' expr {
        char *t = newTemp();
        fprintf(outputFile, "%s = %s - %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '*' expr {
        char *t = newTemp();
        fprintf(outputFile, "%s = %s * %s\n", t, $1, $3);
        $$ = t;
    }
    | expr '/' expr {
        char *t = newTemp();
        fprintf(outputFile, "%s = %s / %s\n", t, $1, $3);
        $$ = t;
    }
    ;

condition:
    ID HIGHWATER NUMBER {
        char *t = newTemp();
        char *label = newLabel();
        fprintf(outputFile, "%s = %s > %d\n", t, $1, $3);
        fprintf(outputFile, "ifFalse %s goto %s\n", t, label);
        $$ = label;
    }
    | ID EQ NUMBER {
        char *t = newTemp();
        char *label = newLabel();
        fprintf(outputFile, "%s = %s == %d\n", t, $1, $3);
        fprintf(outputFile, "ifFalse %s goto %s\n", t, label);
        $$ = label;
    }
    ;

%%

void yyerror(char *s) {
    extern int yylineno;
    fprintf(stderr, "Error at line %d: %s\n", yylineno, s);
}

int main(int argc, char **argv) {
    if (argc != 2) {
        printf("Usage: ./obxc <input_file>\n");
        exit(1);
    }

    yyin = fopen(argv[1], "r");
    outputFile = fopen("output.tac", "w");

    if (!yyin || !outputFile) {
        perror("File error");
        exit(1);
    }

    yyparse();

    fclose(yyin);
    fclose(outputFile);

    return 0;
}