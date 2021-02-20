@interact
def _(m=input_box('sage', label="Enter your message", height=3, 
    width=50, type=str),
    key=input_grid(2,2,default=[[7,12],[3,3]],type=int,width=2),
    spaces = selector(['Plain','LaTeX'], buttons=True)):
    S = HillCryptosystem(AlphabeticStrings(),2)
    M = MatrixSpace(IntegerModRing(26),2,2)
    e = S(M(key).transpose())
    clean_text = S.encoding(str(m.encode('ascii','replace').decode()))
    if len(clean_text)%2 == 1:
        clean_text = S.encoding(str(m)+"Z")
    cipher_text = e(clean_text)
    print(str("Your Hill enciphering text is\n"))
    # Build output in blocks
    text_blocks=""
    for i in range(0,len(cipher_text),5):
        text_blocks+=str(cipher_text[i:i+5])+" "
        if spaces =='LaTeX': text_blocks+="& "
        if (i+5)%40 == 0:
            if spaces =='LaTeX': 
                text_blocks=text_blocks[0:-2]
                text_blocks+="\\tabularnewline"
            text_blocks+="\n"
    print(text_blocks)