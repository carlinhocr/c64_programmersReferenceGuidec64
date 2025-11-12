10 print"{clear}"
20 rem you can activate multicolor character by character
30 POKE 53281,1 : rem set background color white
40 POKE 53282,5 : rem set background color red
50 POKE 53283,9 : rem set background color green
60 rem POKE 53284,8 : rem set foreground color blue
70 poke 53270,peek (53270) or 16
80 c=13*4096+8*256 : rem color code 55296
90 print chr$(147) "aaaaaaaaaa"
100 rem mixing multicolor and high resolution with just two colors
110 for l=0to9
120 poke c+l,8 
130 next
140 rem poke 53270, peek(53270) and 239 turn off multicolor