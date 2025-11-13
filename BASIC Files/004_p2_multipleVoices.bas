10 s=54272
20 REM clear sound chip
30 for l = s to s+24
40 poke l,0
50 next l
60 rem dimension array for the notes of the song
70 rem 1/16 of a measure per location
80 rem highFrequancy, lowFrequency, control waveform+active/deactivate
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
260 next i
270 rem begin decoding loop for each note
280 rem first fill all the notes for a single voice
290 rem then move to the next voice
300 rem voice end marked by 0 in the data statements
310 for k = 0 to 2
320 i=0
330 read nm
340 rem if coded note is zero then goto next voice
350 if nm = 0 then GGGGGGGGGGGGG
360 rem set coded waveform to proper voice i
370 rem if silence then waveform is zero
380 rem wa is the waveform + active/gate bit (bit 0 of control register)
390 wa = v(k)
400 rem wa is the waveform + deactivate/gate bit (bit 0 of control register)
410 wb = wa -1
420 rem the silence is nm < 0 set waveform controls to zero
430 if nm <0 then nm = -nm:wa=0:wb=0
440 rem note formula encoding
450 rem ((((d*8)+o)*16)+n)
460 rem ((((4*8)+5)*16)+2)
470 rem the duration 1/16 is multiplied by 8
480 rem the result of step 1 is added to the octave (0-7)
490 rem the result of step 2 is then multiplied by 16
500 rem the result of step 3 is the added to your note (0-11)
510 rem the silence is the negative of the duration number 1/16 * 128
520 rem coded number 594
530 rem Dura  Octa Note
540 rem 00100 101  0010
550 rem divide by 128 because the duration was multipled by 8
560 rem and then multiplied by 16 to get the octave
570 rem dr = 594/128 = 4 so it is 1/4 the type of note
580 rem oc = (594-128*4)/16 = 5
590 rem nt = 594-128*4-16*5 = 2
600 rem 594 equals a duration of 4 1/16, octave 5 and base note of 2=d
610 rem it is d5
620 rem decode duration
630 dr% = nm/128
640 rem decode octave
650 oc% = (nm-128*dr%)/16
660 rem decode note
670 nt = nm-128*dr%-16*oc%
680 rem get base frequency for the note
690 fr=fq(nt)
700 rem if Octave is th highest 7 skip division
710 rem it is doing it backwards but ok!
720 if oc% = 7 then 770
730 rem divide by two to get to the right frequency per octave
740 for j = 6 to oc% step -1
750 fr = fr / 2
760 next j
770 hf% = fr /256
780 lf% = fr-256*hf%
790 rem load array of frequencies at the correct timing according to duration
800 rem first fill all the notes for a single voice
810 rem load several positions of 1/16 parts on the corresponding voice
820 rem only if sixteenth note dr =1, k=voice number, i=sound 1/16 position
830 if dr%=1 then h(k,i)=%hf
840 if dr%=1 then l(k,i)=%lf
850 if dr%=1 then c(k,i)=wa : rem turn on
860 if dr%=1 then i=i+1 :rem fix position in array for next voice too
870 if dr%=1 then goto 330 : rem read next note for this voice (read nm)
880 rem for all beats of the note that lasts more than 1/16
890 rem but the beat last beat this happens
900 for j = 1 to dr% -1
910 h(k,i) = hf%
920 l(k,i) = lf%
930 c(k,i) = wa : rem turn on
940 i=i+1
950 next j
960 rem for last beat of the note this happens
965 h(k,i) = hf%
920 l(k,i) = lf%
930 c(k,i) = wb : rem turn OFF
940 i = i+1
950 goto 330 : rem read next note for this voice (read nm)
970 