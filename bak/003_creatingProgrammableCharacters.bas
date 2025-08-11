10 rem example 1
20 rem creating programmable characters
30 poke 56334, peek (56334) and 254 : rem turn off keyscan timer
40 poke 1, peek(1) and 251 : rem switch in charrom bit2 with 0
50 rem copy 64 characters
60 for i = 0to63
70 for j=0to7
80 poke12288+i*8+j,peek(53248+i*8+j)
90 nextj:next i
100 poke 1, peek(1) or 4 : rem switch in I/O bit2 with 1
110 poke 56334, peek (56334) or 1 : rem turn on keyscan timer
115 poke 53272,(peek(53272)and240)+12
120 for car=60to63
130 for byte = 0 to 7
140 read number : rem read the data
150 poke 12288+(8*car)+byte,number
160 next byte: next car
170 print chr$(147)tab(255)chr$(60);
180 print chr$(61)tab(55)chr$(62)chr$(63)
190 get a$
200 if a$="" then 190
210 poke 53272,21: rem return to normal charcters
220 data 4,6,7,5,7,7,3,3
230 data 32,96,224,160,224,224,192,192
240 data 7,7,7,31,31,95,143,127
250 data 224,224,224,248,248,248,240,224
260 end 