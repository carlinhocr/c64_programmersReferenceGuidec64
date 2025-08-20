10 rem bitmap multicolor
20 ca(0)=1:ca(1)=4:ca(2)=16:ca(3)=64:rem arrayfor bitpairs
30 be =2*4096
40 poke 53272,peek(53272) or 8: rem bitmap memory on 8192
50 poke 53265,peek(53265) or 32:rem turn on bitmap graphics
60 poke 53270,peek(53270) or 16:rem turn on multicolor
70 a$="":for i=1to37:a$=a$+"c":next
80 print chr$(19);
90 for i = 1 to 27:print a$;:next:poke2023,peek(2022):rem set color map
100 a$="":for i=1to128:a$=a$+"@":next
110 for i=32to63 step2
120 poke648,i:rem define top of screen memory
130 print chr$(19);a$;a$;a$;a$:next
131 poke648,4:rem clear hi-res screen
140 for cp=1to3:for y=0to199 step.5:rem from the top of the screen to the bottom
150 x=int(10*cp+50+15*sin(cp*45+y/10)):rem sine wave shape
160 by=be+40*(y and 248)+(y and 7)+(x*2 and 504):rem find hi-res byte
170 bi=(not x and 3):poke by,peek(by) and (not 3*ca(bi)) or (cp*ca(bi))
180 next y,cp
190 goto 190:rem stay on screen