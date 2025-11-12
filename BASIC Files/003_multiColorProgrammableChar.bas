10 rem example 2
20 rem multicolor programmable characters
30 poke 56334, peek (56334) and 254 : rem turn off keyscan timer
40 poke 1, peek(1) and 251 : rem switch in charrom bit2 with 0
50 rem copy 64 characters
60 for i = 0to63
70 for j=0to7
80 poke12288+i*8+j,peek(53248+i*8+j)
90 nextj:next i
100 poke 1, peek(1) or 4 : rem switch in I/O bit2 with 1
110 poke 56334, peek (56334) or 1 : rem turn on keyscan timer
120 poke 53272,(peek(53272)and240)+12
130 for car=60to63
140 for byte = 0 to 7
150 read number : rem read the data
160 poke 12288+(8*car)+byte,number
170 next byte: next car
180 rem start multicolor
190 poke 53270,peek(53270) or 16 : rem start multicolor
200 poke 53281,0 :rem backgroung 0 black
210 poke 53283,2 :rem backgroung 1
220 poke 53283,7 :rem backgroung 2
230 print chr$(147)tab(255)chr$(60);
240 print chr$(61)tab(55)chr$(62)chr$(63)
250 get a$
260 if a$="" then 250
270 poke 53272,21: rem return to normal charcters
280 data 129,37,21,29,93,85,85,85
290 data 66,72,84,116,117,85,85,85
300 data 87,87,85,21,8,8,40,0
310 data 213,213,85,84,32,32,40,0
320 end