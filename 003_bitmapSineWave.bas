10 rem SYN wave function
20 be =2*4096
30 poke 53272, peek(53272) or 8: rem bitmap memory on 8192
40 poke 53265,peek(53265) or 32 :rem turn on bitmp graphics
50 for i = be to be + 7999: poke i,0 : next: rem clear bitmap screen
60 for i = 1024 to 2023:poke i,3:next: rem fill color memory with cyan and black
70 rem calculate each x and y to draw the syn wave
80 for x=0to319 step .5
90 y=int(90+80*sin(x/10))
100 rem find the position of the pixel
110 ca=int(x/8) :rem find the character column 0 to 39
120 ro=int(y/8) :rem find the row from 0 to 23
130 ln=y and 7 : rem find the line inside the row vertical
140 by=be+ro*320+8*ca+ln : rem find the byte number horizontal
150 bi=7-(xand7) : rem find the bit inside the byte horizontal
155 rem draw the pixel
160 poke(by),peek(by)or(2^bi);rem power to the bit number to convert dec.
170 next x
180 poke 1024,16
190 goto 190