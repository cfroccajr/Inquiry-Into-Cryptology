import textwrap
@interact
def _(p = input_box('abcdefghijklmnopqrstuvwxyz',label='Plain', type=str,width=50,height=1),
            c = input_box('ZYXWVUTSRQPONMLKJIHGFEDCBA',label='Cipher', type=str,width=50,height=1),
            shift=[0..25],
            mode=selector(['encipher','decipher'], buttons=True),
            spaces = selector(['yes','no'], buttons=True),
            m=input_box('sage', label="Message", height=5, width=50, type=str)):
    P = str(p.encode('ascii','replace').decode()).upper()
    C = str(c.encode('ascii','replace').decode()).upper()
    C = C[shift:]+C[:shift]
    Message = str(m.encode('ascii','replace').decode()).upper()
    print("\nPlain alphabet: \t", str(P).lower())
    print("Cipher alphabet:\t", str(C))
    if len(C)!=len(P):
        print("Key lengths do not match.")
    else:
        if mode == 'encipher':
            inText = P
            outText = C
        else:
            inText = C.lower()
            outText = P.lower()
            Message = Message.lower()
        output = ""
        for char in Message:
            try:
                position = inText.index(char)
                output += outText[position]
            except:
                if spaces=='yes': output += char
                else: pass
        print("\nHere is your output:\n")
        if spaces == 'yes':
            print(textwrap.fill(output, 50))
        else:
            for i in range(0,len(output),5):
                print(output[i:i+5],)
                if (i+5)%50 == 0: print("\n")