
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     POGUES = 258,
     KOOKS = 259,
     JOHNB = 260,
     SARAHS = 261,
     WARD = 262,
     TOPPER = 263,
     CLEO = 264,
     RILEY = 265,
     KIARA = 266,
     SIMON = 267,
     TEAGUE = 268,
     POPE = 269,
     JJ = 270,
     BEAUMONT = 271,
     HIGHWRECK = 272,
     MAP = 273,
     TREASURE = 274,
     SEARCH = 275,
     DIVE = 276,
     GOLD = 277,
     SHIPWRECK = 278,
     STORM = 279,
     ISLAND = 280,
     TIDE = 281,
     CURRENT = 282,
     ANCHOR = 283,
     ROPE = 284,
     SALVAGE = 285,
     SCRAP = 286,
     CODEBOOK = 287,
     MEMBER = 288,
     LOCK = 289,
     KEY = 290,
     HIDEOUT = 291,
     STASH = 292,
     CACHE = 293,
     LOOT = 294,
     TRADE = 295,
     SIGNAL = 296,
     RADIO = 297,
     LISTEN = 298,
     MESSAGE = 299,
     ROUTE = 300,
     CHARTED = 301,
     UNLOCKED = 302,
     BURIED = 303,
     HIGHWATER = 304,
     ID = 305,
     STRING = 306,
     NUMBER = 307,
     LTE = 308,
     GTE = 309,
     EQ = 310,
     NEQ = 311,
     UMINUS = 312
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 35 "obx.y"

    int num;
    char* id;



/* Line 1676 of yacc.c  */
#line 116 "obx.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


