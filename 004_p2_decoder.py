print ("Note Decoder")
notes=["c","c#","d","d#","e","f","f#","g","g#","a","a#","b"]
number = 1575
dr = int(number/128)
oc = int((number-128*dr)/16)
nt = int(number-128*dr-16*oc)
print("note: ",nt)
print("octave: ",oc)
print("duration: ",dr)
print(notes[nt]+str(oc)+","+str(dr))
# 594
#   Duration   Octave Note
# 0 0100       101    0010
# 1575
#   Duration   Octave Note
# 0 1100       010    0111
# 1618
#   Duration   Octave Note
# 0 1100       101    0010
