%{
#include "obx.tab.h"
#include <string.h>
#include <stdio.h>

void yyerror(char *);
int yylineno = 1;
%}

DIGIT  [0-9]
ID     [a-zA-Z_][a-zA-Z0-9_]*

STRING_LITERAL \"[^\"\n]*\"

%%

[ \t\n]                 ;
"//"[^\n]*              ;

"pogues"               { return POGUES; }
"kooks"                { return KOOKS; }
"johnb"                { return JOHNB; }
"sarah"                { return SARAHS; }
"ward"                 { return WARD; }
"topper"               { return TOPPER; }
"cleo"                 { return CLEO; }
"riley"                { return RILEY; }
"kiara"                { return KIARA; }
"simon"                { return SIMON; }
"teague"               { return TEAGUE; }
"pope"                 { return POPE; }
"jj"                   { return JJ; }
"beaumont"             { return BEAUMONT; }
"map"                  { return MAP; }
"treasure"             { return TREASURE; }
"search"               { return SEARCH; }
"dive"                 { return DIVE; }
"gold"                 { return GOLD; }
"shipwreck"            { return SHIPWRECK; }
"island"               { return ISLAND; }
"storm"                { return STORM; }
"tide"                 { return TIDE; }
"current"              { return CURRENT; }
"anchor"               { return ANCHOR; }
"rope"                 { return ROPE; }
"salvage"              { return SALVAGE; }
"scrap"                { return SCRAP; }
"codebook"             { return CODEBOOK; }
"member"               { return MEMBER; }
"lock"                 { return LOCK; }
"key"                  { return KEY; }
"hideout"              { return HIDEOUT; }
"stash"                { return STASH; }
"cache"                { return CACHE; }
"loot"                 { return LOOT; }
"trade"                { return TRADE; }
"signal"               { return SIGNAL; }
"radio"                { return RADIO; }
"listen"               { return LISTEN; }
"message"              { return MESSAGE; }
"route"                { return ROUTE; }
"charted"              { return CHARTED; }
"unlocked"             { return UNLOCKED; }
"buried"               { return BURIED; }
"highwater"            { return HIGHWATER; }

{DIGIT}+               { yylval.num = atoi(yytext); return NUMBER; }
{ID}                   { yylval.id = strdup(yytext); return ID; }

"<="                   { return LTE; }
">="                   { return GTE; }
"=="                   { return EQ; }
"!="                   { return NEQ; }

{STRING_LITERAL}       {
    yylval.id = strdup(yytext + 1);
    yylval.id[strlen(yylval.id) - 1] = '\0';
    return STRING;
}

"("                    { return '('; }
")"                    { return ')'; }
";"                    { return ';'; }
","                    { return ','; }
"{"                    { return '{'; }
"}"                    { return '}'; }
"-"                    { return '-'; }
"+"                    { return '+'; }
"*"                    { return '*'; }
"/"                    { return '/'; }
"="                    { return '='; }

.                      { printf("Unknown character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}