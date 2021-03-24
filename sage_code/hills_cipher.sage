import re
import math
alphabet="abcdefghijklmnopqrstuvwxyz"

def prep_str(str):
    out_str = re.sub("[^a-z]","",str.lower())
    if len(out_str)%2==1:
        out_str += "nul"
    return out_str

def hill_cipher(str,key=[[5,7],[0,1]],shift=[0,0]):
    in_str = prep_str(str)
    out_str = ""
    a = key[0][0]
    b = key[0][1]
    c = key[1][0]
    d = key[1][1]
    if math.gcd(a*d-b*c,26)!=1:
        return False
    else:
        for i in range(0,len(in_str),2):
            try:
                l1=alphabet.index(in_str[i])
                l2=alphabet.index(in_str[i+1])
                O1=(a*l1+b*l2+shift[0])%26
                O2=(c*l1+d*l2+shift[1])%26
                out_str+=alphabet[O1].upper()+alphabet[O2].upper()
            except:
                print("Something went wrong, you should investigate it like Sherlock Holmes!!")
        return(out_str)

@interact
def _(m=input_box('sage', label="Enter your message", height=3, 
    width=50, type=str),
    key=input_grid(2,2,default=[[1,0],[0,1]],type=int,width=2),
    shift=input_grid(2,1,default=[0,0],type=int,width=2),
    spaces = selector(['Plain','LaTeX'], buttons=True)):
    plain_text = m.encode('ascii','replace').decode()
    cipher_text=hill_cipher(plain_text,key,[shift[0][0],shift[1][0]])
    if not cipher_text:
        print("Invalid Key")
    else:
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