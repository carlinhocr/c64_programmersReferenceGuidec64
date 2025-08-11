10 print "replace the letter t for a smile"
20 REM byte 52 is hight byte 48. 51 is low byte 00
30 REM this give address 0011 0000 0000 0000 or 12288
40 poke 52,48: poke 56,48 : clr
50 print chr$(142): rem switch uppercase
60 poke 56334, peek (56334) and 254 : rem turn off keyscan timer
70 poke 1, peek(1) and 251 : rem switch in charrom bit2 with 0
80 rem 53248 = $d000 where char rom appears in ram
90 rem move charrom to ram at $3000 or 12288
100 rem copy 64 characters (512/8)
110 print "moving char rom"
120 for i = 0 to 511:poke i + 12288, peek (i+53248): next
130 poke 1, peek(1) or 4 : rem switch in I/O bit2 with 1
140 poke 56334, peek (56334) or 1 : rem turn on keyscan timer
150 rem select 12288 to get he new char data from ram
160 rem 53272 is vic control register
170 poke 53272,(peek(53272)and 240)+12
180 print "t"
190 print "waiting"
200 for x = 1 to 5000 : next : rem wait a few seconds
210 rem modify t to be a smile
220 for i = 12448 to 12448 +7:read a: poke i,a:next
230 data 60,66,165,129,165,153,66,60
240 print "t"
250 end