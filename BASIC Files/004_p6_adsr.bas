10 s=54272
20 REM clear sound chip
30 for l = s to s+24
40 poke l,0
50 next
60 rem set attack decay sustain release
70 rem attack 0 = 2ms
80 rem decay 9 = 750ms
90 poke s+5,9 
100 rem sustain 0 = 0 volume proportion of the attack volume
110 rem sustain lasts as long as the gate bit is set
120 rem release 0 = 6ms
130 rem poke s+6,0
140 rem set attack decay sustain release
150 rem attack 5 = 56ms
160 rem decay 8 = 300ms
170 poke s+5,88 
180 rem sustain 0 = 192 volume proportion of the attack volume
190 rem sustain lasts as long as the gate bit is set
200 rem release 3 = 72ms
210 poke s+6,195
220 rem set volume to maxium
230 poke s+24,15
240 rem read data Hifrequency, Lowfrequency, duration
250 read hf,lf,dr
260 if hf <0 then end
270 rem add high and low frequency data to Voice 1
280 poke s+1,hf
290 poke s,lf
300 rem set waveform as sawtooth (bit 5) and activate gate bit (bit 0)
310 rem to acticate the attack decay sustain cycle
320 rem 0010 0001
330 poke s+4,33
340 rem wait for duration befor ending envelope
350 for t = 1 to dr
360 next
370 rem set waveform as sawtooth (bit 5) and deactivate gate bit (bit 0)
380 rem to activate the release cycle and end the note
390 poke s+4,32
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