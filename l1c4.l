%{
#include "l1c4.tab.h"   
%}

DIGIT      [0-9]
INT_ONLY   {DIGIT}+
DECIMAL    ({DIGIT}+\.{DIGIT}+)|(\.{DIGIT}+)
EXPONENT   ({DIGIT}+(\.{DIGIT}+)?[Ee][\+\-]?{DIGIT}+)
FLOAT_NUM  {DIGIT}+(\.{DIGIT}+)?([Ee][\+\-]?{DIGIT}+)?   /* Optional */

%%

{EXPONENT}   { return EXPONENT; }
{DECIMAL}    { return DECIMAL; }
{INT_ONLY}   { return INT_ONLY; }

[ \t\n]+     ;           
.            ;           

%%

int yywrap(void) {
    return 1;
}
