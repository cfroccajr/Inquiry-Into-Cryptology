import re
import random
import textwrap

# Constants
alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ 01234"

murray_code_dict={'A':'11000', 'B':'10011', 'C':'01110', 'D':'10010', 'E':'10000', 'F':'10110', 'G':'01011', 
    'H':'00101', 'I':'01100','J':'11010', 'K':'11110', 'L':'01001', 'M':'00111', 'N':'00110', 'O':'00011', 
    'P':'01101', 'Q':'11101', 'R':'01010', 'S':'10100', 'T':'00001', 'U':'11100', 'V':'01111', 'W':'11001', 
    'X':'10111', 'Y':'10101', 'Z':'10001',' ':'00100',"1":"00010","2":"01000","0":"00000","3":"11011","4":"11111"}

reverse_murray_dictionary = {v:k for k,v in murray_code_dict.items()} 

# Helper Functions
def bit_add(str1,str2):
    output=""
    if len(str1)==len(str2):
        for chr1,chr2 in zip(str1,str2):
            if chr1 == chr2:
                output+="0"
            else:
                output+="1"
        return output
    else:
        return "Bit Length Mismatch"

def vernam_encode(str,key):
    cipher=""
    if len(str)==len(key):
        for c,k in zip(str,key):
            bit1=murray_code_dict[c.upper()]
            bit2=murray_code_dict[k.upper()]
            output=bit_add(bit1,bit2)
            try:
                output=reverse_murray_dictionary[output]
                cipher+=output
            except:
                cipher+=""
        return cipher
    else:
        return "Key Length Mismatch"

# Main Interact
@interact
def _(m=input_box('sage', label="Enter your message", height=3, width=50, type=str),
        key=input_box('sage', label="Enter your key", height=3, width=50, type=str),
        mode = selector(['Given Key','Random Key'], buttons=True)):
# Clean the Input deleting non-alpah numeric or spaces
    clean_message = re.sub('[^A-Z0-4 ]','',m.upper())
    if mode == 'Given Key':
        clean_key = re.sub('[^A-Z0-4 ]','',key.upper())
    else:
        clean_key="".join(random.choices(alphabet, k = len(clean_message)))
    cipher_text = vernam_encode(clean_message,clean_key)
# Output Cipher
    plain_out = '"'+clean_message+'"'
    key_out = '"'+clean_key+'"'
    cipher_out = '"'+cipher_text+'"'
    print("Here is your plaintext of length %d:" %len(clean_message))
    print(textwrap.fill(plain_out,42))
    print("\nHere is your key of length %d:" %len(clean_key))
    print(textwrap.fill(key_out,42))
    print("\nHere is your ciphertext of length %d:" %len(cipher_text))
    print(textwrap.fill(cipher_out, 42))