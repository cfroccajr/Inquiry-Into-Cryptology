@interact
def _(
    c=input_box("T",type=str,height=1,width=5,label="Char. 1:"),
    C=input_box("4",type=str,height=1,width=5,label="Char. 2:")):
    print("Convert %s and %s to bits and add them:" %(c,C))
    try:
        co = ord(c)
        Co = ord(C)
        cb = format(co,'b')
        cb = "0"*(7-len(cb))+cb
        Cb = format(Co,'b')
        Cb = "0"*(7-len(Cb))+Cb
        bsum = format(co^^Co,'b')
        bsum = "0"*(7-len(bsum))+bsum
        print("%s \u2295 %s \u2261 %d \u2295 %d = (%s)\u2082 \u2295 (%s)\u2082 = (%s)\u2082" %(c,C,co,Co,cb,Cb,bsum))
    except:
        print("Error in summation")