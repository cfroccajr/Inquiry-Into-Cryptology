@interact
def _(m=input_box('sage', label="Enter your message", height=3, 
    width=50, type=str),
    key=input_grid(2,2,default=[[7,12],[3,3]],type=int,width=2)):
    S = HillCryptosystem(AlphabeticStrings(),2)
    M = MatrixSpace(IntegerModRing(26),2,2)
    e = S(M(key).transpose())
    clean_text = S.encoding(str(m.encode('ascii','replace')))
    if len(clean_text)%2 == 1:
        clean_text = S.encoding(str(m)+"Z")
    cipher_text = e(clean_text)
    print str("Your Hill enciphering text is\n")
    for i in xrange(0,len(cipher_text),5):
        print cipher_text[i:i+5],
        if (i+5)%50 == 0: print "\n"