import re
import unicodedata
import textwrap

def strip_string(string, asciified=True, upper=True, spaces=True):
    cleaned = string
    if asciified:
        cleaned = unicodedata.normalize('NFD',cleaned).encode('ascii','ignore')
        cleaned = cleaned.decode('ascii')
    if upper:
        cleaned = cleaned.upper()
    else:
        cleaned = cleaned.lower()
    if not spaces:
        cleaned = unicodedata.normalize('NFD',cleaned).encode('ascii','ignore')
        cleaned = cleaned.decode('ascii')
        cleaned = re.sub('[^A-Za-z]','',cleaned)
    return cleaned

def shift_by_character(ch,sh_ch,encipher=True,alphabet='abcdefghijklmnopqrstuvwxyz'):
    alphabet = strip_string(alphabet,True,False)
    ch = strip_string(ch,True,False)
    sh_ch = strip_string(sh_ch,True,False)
    try:
        ch_index = alphabet.index(ch)
        shift = alphabet.index(sh_ch)
        if encipher:
            new_ch_index = (ch_index+shift)%len(alphabet)
        else:
            new_ch_index = (ch_index-shift)%len(alphabet)
        new_char = alphabet[new_ch_index]
    except:
        new_char = ch
    return new_char

def vigenere(string,key,encipher=True,alphabet='abcdefghijklmnopqrstuvwxyz'):
    output = ""
    for (i,ch) in enumerate(string):
        key_index = i%len(key)
        sh_ch = key[key_index]
        output += shift_by_character(ch,sh_ch,encipher,alphabet)
    return output
        

##def _(m=input_box('sage', label="Enter your message", height=3, width=50, type=str),
##        key=input_box('sage', label="Enter your key", height=1, width=20, type=str),
##        mode = selector(['encipher','decipher'], buttons=True),
##        spaces = selector(['yes','no'], buttons=True)):
##    plain_alpha = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
##    clean_message = str(m.encode('ascii','replace')).upper()
##    if spaces == 'no':
##        clean_message = re.sub('[^A-Z]','',clean_message)
##    cipher_key = re.sub('[^A-Z]','',str(key.encode('ascii','replace')).upper())
##    key_list = [plain_alpha.index(ch) for ch in cipher_key]
##    if mode == 'decipher':
##        key_list = [-1*k for k in key_list] 
##    cipher_text = ""
##    key_counter = 0
##    for ch in clean_message:
##        try:
##            tmp_pos = plain_alpha.index(ch)
##            cipher_pos = (tmp_pos+key_list[key_counter])%26
##            cipher_text += plain_alpha[cipher_pos]
##            key_counter = (key_counter+1)%len(key_list)
##        except:
##            if spaces == 'yes':
##                cipher_text += ch
##    print "\nHere is your output:\n"
##    if spaces == 'yes':
##        print textwrap.fill(cipher_text, 42)
##    else:
##        for i in xrange(0,len(cipher_text),6):
##            print cipher_text[i:i+6],
##            if (i+6)%42 == 0: print "\n"
