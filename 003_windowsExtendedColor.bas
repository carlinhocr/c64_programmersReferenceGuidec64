10 rem extended color mode draw three windows
20 dim ro$(25)
30 ro$(0)=chr$(19)
40 for i=1to24:ro$(i)=ro$(i-1)+chr$(17):next i
50 poke 53265,peek(53265) or 64:rem turn on extenden color mode
60 rem set up border color, bg0,bg1,gb2,bg3
70 poke 53280,0:poke 53281,0:poke53282,1:poke53283,2:poke53284,13
80 op$=chr$(160):rem blank char
90 for i=1to4:op$=op$+op$:next i:print chr$(147);ro$(3);
100 for i=1to10: print tab(1);chr$(18);"               ";tab(23);op$:next
110 print chr$(146):print:print:for i=1to4:print op$;op$;op$;op$;op$;:next i
120 rem chr$(5) set letter color to grey
130 print ro$(5);chr$(5);chr$(18);tab(2);"a red window"
140 print chr$(18);tab(2);"could be used"
150 print chr$(18);tab(2);"for error"
160 print chr$(18);tab(2);"messages"
170 a$="a green window":gosub 410:print ro$(5);chr$(144);chr$(18);tab(24);b$
180 a$="could be used":gosub 410:print tab(24);chr$(18);b$
190 a$="to give":gosub 410:print tab(24);chr$(18);b$
200 a$="instructions":gosub 410:print tab(24);chr$(18);b$
210 print chr$(31);ro$(19);
220 a$="  while the main window could be used":gosub410:print b$
230 a$="  for accepting commands":gosub410:print b$
240 rem delete backroung green windows
250 for i=1to5000:nexti:poke53284,0
260 rem flash screen
270 for i=1to5:forj=1to300:next j: poke53282,15
280 for j=1to300:next j:poke53282,1
290 next i
300 rem switch background to black red window
310 rem poke 53283,-2*(peek(53283)=240)
320 rem poke 52384,-13*(peek(53284)=240)
330 print ro$(5);chr$(0);chr$(18);tab(2);"             "
335 for i = 1to3:print chr$(18);tab(2);"             ":nexti
370 poke 53283,0
380 goto 270
390 goto 390
400 rem translation subroutine for the 4 backroung colors
410 b$="":for i=1tolen(a$):b=asc(mid$(a$,i,1))
420 b=b+32:ifb<96 then b=b+96
430 b$=b$+chr$(b):next i : return