10 s=54272
20 REM clear sound chip
30 for l = s to s+24
40 poke l,0
50 next
60 rem dimension array for the notes of the song
70 rem 1/16 of a measure per location
80 rem highFrequancy, lowFrequency
90 dim h(2,200),l(2,200),c(2,200)
100 rem dimension array for base frequency of each note
110 dim fq(11)
120 rem waveform control form for each voice and start ADS (bit0)
130 v(0)=17 :rem 0001 0001 triangle wave form, start ADS cycle
140 v(1)=65 :rem 0100 0001 pulse wave form, start ADS cycle
150 v(2)=33 :rem 0010 0001 sawtooth wave form, start ADS cycle
160 rem set high pulse width for Voice 2 pwHigh
170 poke s+10,8
180 rem set high frequency for filter cut off
190 poke s+22,128
200 rem set maximum resonance for filter and filter voice 3
210 rem 1111 0100
220 poke s+23,244
230 rem read in base frequency for each note
240 for i=0 to 11
250 read fq(i)
260 next
270 rem begin decoding loop for each note
280 for k = 0 to 2
290 i=0
300 read nm
310 rem if coded note is zero then goto next notw
320 if nm = 0 then GGGGGGGGGGGGG
330 rem set coded waveform to proper voice i
340 rem if silence then waveform is zero