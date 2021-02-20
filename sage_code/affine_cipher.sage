
import re
@interact
def _(me=input_box('sage', label="Enter your message", height=3, width=50, type=str),m=[1..25], s=[0..25],
    spaces = selector(['Plain','LaTeX'], buttons=True)):
    S = AffineCryptosystem(AlphabeticStrings())
    clean_text = S.encoding(str(me.encode('ascii','replace').decode()))
    try:
        e = S(m,s)
        cipher_text = e(clean_text)
        print("Your affine enciphering text is\n")
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
    except:
        print("error, likely in your key")
        cipher_text = clean_text