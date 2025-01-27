70 poke 53270,peek (53270) or 16
80 printchr$(147);:printchr$(18);
90 print"{orange}";:REM c= & 1
100 forl=1to22:printchr$(65);:next
110 fort=1to500:next
120 print"{blue}";:REM ctrl & 7
130 fort=1to500:next
140 print" {black}hit a key":rem  ctrl & 1
150 get a$:if a$=""then 150
160 x=int(rnd(1)*16)
170 poke53282,x : rem background #1
180 goto 150