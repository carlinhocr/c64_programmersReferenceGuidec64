10 rem extended color mode
20 rem put 4 white letters on the screen
25 print chr$(147)
30 for i = 0 to 3
40 poke 1230 + (i*8),i*64+1
50 poke 55502+(i*8),1
60 next
70 rem wait for a key
80 print "normal mode"
150 get a$:if a$=""then 150
160 rem put colors on bacjrgound register
170 poke 53282,0 : rem black for background 2
180 poke 53283,2 : rem red for background 3
190 poke 53284,5 : rem green for background 4
200 rem activate extended color mode
210 poke 53265, peek(53265) or 64
215 print "extended color mode"
220 get a$:if a$=""then 220
230 rem turn off extended color
240 poke 53265, peek(53265) and 191
