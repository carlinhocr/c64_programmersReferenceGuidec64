10 s=54272
20 REM clear sound chip
30 for l = s to s+24
40 poke l,0
50 next
60 poke s+5,144:poke s+6,243: rem a9 d0 s5 r3
70 poke s+3,8:poke s+2,8 : rem set pulse width
220 rem set volume to maxium
230 poke s+24,15
240 rem read data Hifrequency, Lowfrequency, duration
250 read hf,lf,dr
260 if hf <0 then end
270 rem add high and low frequency data to Voice 1
280 poke s+1,hf
290 poke s,lf
330 poke s+4,65
340 rem wait for duration befor ending envelope
350 for t = 1 to dr
360 next
390 poke s+4,64
400 rem wait between notes
410 for t = 1 to 50
420 next
430 goto 250 : rem keep reading the data
440 rem data with the highFrequency, lowFrequency, duration of the notes
450 data 25,177,250,28,214,250: rem g4,a4
460 data 25,177,250,25,177,250: rem g4,g4
470 data 25,177,250,28,214,125: rem g4,a4 
480 data 32,94,250,25,177,250 : rem b4,g4
490 data 28,214,250,19,63,250 : rem a4,d#4
500 data 19,63,250,19,63,250  : rem d#4,d#4
510 data 21,154,63,24,63,63   : rem e4,f#4
520 data 25,177,250,24,63,125 : rem g4,f#4
530 data 19,63,250,-1,-1,-1   : rem d#4