@interact
def _(me=input_box('sage', label="Enter your message", height=3, width=50, type=str),m=[1..25], s=[0..25]):
    S = AffineCryptosystem(AlphabeticStrings())
    clean_text = S.encoding(str(me.encode('ascii','replace')))
    try:
        e = S(m,s)
        cipher_text = e(clean_text)
        print "Your affine enciphering text is\n"
        for i in xrange(0,len(cipher_text),5):
            print cipher_text[i:i+5],
            if (i+5)%50 == 0: print "\n"
    except:
        print "error, likely in your key"
        cipher_text = clean_text