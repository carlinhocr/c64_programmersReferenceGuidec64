10 print "free ram"
20 print fre(0)-(sgn(fre(0))<0)*65536
30 REM byte 52 is hight byte 48. 51 is low byte 00
40 REM this give address 0011 0000 0000 0000 or 12288
50 poke 52,48: poke 56,48 : clr
60 print "free ram after protecting $3000/12288"
70 print fre(0)-(sgn(fre(0))<0)*65536
80 print chr$(142): rem switch uppercase
90 poke 56334, peek (56334) and 254 : rem turn off keyscan timer
100 poke 1, peek(1) and 251 : rem switch in charrom bit2 with 0
110 rem 53248 = $d000 where char rom appears in ram
120 rem move charrom to ram at $3000 or 12288
130 rem copy 64 characters (512/8)
140 for i = 0 to 511:poke i + 12288, peek (i+53248): next
150 poke 1, peek(1) or 4 : rem switch in I/O bit2 with 1
160 poke 56334, peek (56334) or 1 : rem turn on keyscan timer
170 rem select 12288 to get he new char data from ram
180 rem 53272 is vic control register
190 poke 53272,(peek(53272)and 240)+12
200 print "@"
210 for x = 1 to 5000 : next : rem wait a few seconds
220 rem modify @ to be its reverse
230 for i = 12288 to 12288 +7:poke i,255-peek(i):next
240 print "@"
250 end