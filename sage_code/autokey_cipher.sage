import re
import textwrap
@interact
def _(m=input_box('sage', label="Enter your message", height=3, width=50, type=str),
        alpha=input_box('ABCDEFGHIJKLMNOPQRSTUVWXYZ', label="Alphabet", height=1, width=50, type=str),
        key=input_box('sage', label="Enter your key", height=1, width=20, type=str),
        mode = selector(['encipher','decipher'], buttons=True),
        model = selector(['original','modern'], buttons=True),
        spaces = selector(['yes','no','LaTeX'], buttons=True)):

# Clean input text and set key:

    clean_message = str(m.encode('ascii','replace').decode()).upper()
    spaceless_message = re.sub('[^A-Z]','',clean_message)
    if spaces == 'no':
        clean_message = spaceless_message
    cipher_key = re.sub('[^A-Z]','',str(key.encode('ascii','replace').decode()).upper())
    cipher_key += spaceless_message
    key_list = [alpha.index(ch) for ch in cipher_key]

# Set method original/modern

    if model == 'original':
        temp_keys=[]
        for key in key_list:
            temp_keys.append((key-key%2)/2)
        key_list=temp_keys

# Set key to encipher/decipher:

    if mode == 'decipher':
        key_list = [-1*k for k in key_list] 
    cipher_text = ""
    key_counter = 0

# Encipher/decipher message:

    for ch in clean_message:
        try:
            tmp_pos = alpha.index(ch)
            cipher_pos = (tmp_pos+key_list[key_counter])%26
            cipher_text += alpha[cipher_pos]
            key_counter = (key_counter+1)%len(key_list)
        except:
            if spaces == 'yes':
                cipher_text += ch

# Print message:

    print("\nHere is your output:\n")
    if spaces == 'yes':
        print(textwrap.fill(cipher_text, 42))
    else:
        # Build output in blocks
        text_blocks=""
        for i in range(0,len(cipher_text),5):
            text_blocks+=cipher_text[i:i+5]+" "
            if spaces =='LaTeX': text_blocks+="& "
            if (i+5)%40 == 0:
                if spaces =='LaTeX': 
                    text_blocks=text_blocks[0:-2]
                    text_blocks+="\\tabularnewline"
                text_blocks+="\n"
        print(text_blocks)