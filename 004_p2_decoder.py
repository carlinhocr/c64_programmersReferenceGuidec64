def noteDecoder(noteDecode): 
    print("Note Decoder");
    notes=["c","c#","d","d#","e","f","f#","g","g#","a","a#","b"];
    #number = 1575;
    number = noteDecode;
    dr = int(number/128);
    oc = int((number-128*dr)/16);
    nt = int(number-128*dr-16*oc);
    # print("note: ",nt);
    # print("octave: ",oc);
    # print("duration: ",dr);
    # print(notes[nt]+str(oc)+","+str(dr));
    return notes[nt]+str(oc),dr
    # 594
    #   Duration   Octave Note
    # 0 0100       101    0010
    # 1575
    #   Duration   Octave Note
    # 0 1100       010    0111
    # 1618
    #   Duration   Octave Note
    # 0 1100       101    0010

def voiceSplitter(vNo,vDu,vWave):
    #v1=["a4",1,"b6",2,"c3",4];
    #vNo=["a4","b6","c3"];
    #vdu=[1,2,4];
    vSplitted=[];
    vSplitWave =[];
    for i in range(0,len(vNo)):
        print ("nota",vNo[i]);
        print("duration",vDu[i]);
        for j in range(0,vDu[i]):
            vSplitted.append(vNo[i]);
            if j == vDu[i]-1:
                vSplitWave.append(vWave+1);
            else:
                vSplitWave.append(vWave);
    return(vSplitted,vSplitWave);      

def translateNotes(vSource):
    vNo = [];
    vDu = [];
    for noteCoded in vSource:
        noteDec,durDec= noteDecoder(noteCoded);
        vNo.append(noteDec);
        vDu.append(durDec);
    return vNo,vDu

def sliceNotes(vSource,vWave):
    #vSource=[594,594,594,596,596,1618,587,592,587,585,331,336];
    vNo,vDu = translateNotes(vSource);
    vSplitted,vSpliWave = voiceSplitter(vNo,vDu,vWave);
    return vSplitted,vSpliWave

def formatAssembler(vSplitted,vSplitWave):
    chunk_size = 10
    vToPrint=[]
    for i in range(0, len(vSplitted), chunk_size):
        vToPrint.append(vSplitted[i:i + chunk_size]);
    for line in vToPrint:
        lineAssemblerByte = ""
        ;


def main():
    #print(noteDecoder());
    #voiceSplitter();
    vWave=32
    vSource=[594,594,594,596,596,1618,587,592,587,585,331,336];
    vSplitNotes,vSplitWave=sliceNotes(vSource,vWave);
    formatAssembler(vSplitNotes,vSplitWave);
    

if __name__ == "__main__":
    main()