10 s=54272
20 REM clear sound chip
30 for l = s to s+24
40 poke l,0
50 next
60 rem set attack decay sustain release
70 poke s+5,9
80 poke s+6,0
90 rem set volume to maxium
100 poke s+24,15
110 rem read data Hifrequency, Lowfrequency, duration
120 read hf,lf,dr
130 if hf <0 then end
140 rem add high and low frequency data to Voice 1
150 poke s+1,hf
160 poke s,lf
170 rem set waveform as noise (bit 7) and activate gate bit (bit 0)
180 rem to acticate the attack decay sustain cycle
190 rem 1000 0001
200 poke s+4,129
210 rem wait for duration befor ending envelope
220 for t = 1 to dr
230 next
240 rem set waveform as noise (bit 7) and deactivate gate bit (bit 0)
250 rem to activate the release cycle and end the note
260 poke s+4,128
270 rem wait between notes
280 for t = 1 to 50
290 next
300 goto 120 : rem keep reading the data
310 rem data with the highFrequency, lowFrequency, duration of the notes
320 data 25,177,250,28,214,250: rem g4,a4
330 data 25,177,250,25,177,250: rem g4,g4
340 data 25,177,250,28,214,125: rem g4,a4 
350 data 32,94,250,25,177,250 : rem b4,g4
360 data 28,214,250,19,63,250 : rem a4,d#4
370 data 19,63,250,19,63,250  : rem d#4,d#4
380 data 21,154,63,24,63,63   : rem e4,f#4
390 data 25,177,250,24,63,125 : rem g4,f#4
400 data 19,63,250,-1,-1,-1   : rem d#4