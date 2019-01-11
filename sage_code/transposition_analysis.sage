#message_blocks=['HIPYEN', 'TAUTCI', 'WSDWPF', 'ETTEEA', 'ARONRN', 'ENPMNC', 'RTEPTH', 'RERHR', 'EMTCA', 'PPHHI']

key_order = [3,4,5,2,1,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30]

message = 'HIPYEN TAUTCI WSDWPF ETTEEA ARONRN ENPMNC RTEPTH RERHR  EMTCA  PPHHI  OREOL  FAIEL  TETCA  RNRNF OSIAN MYWRR  RTNIU  CEDNN  ASIAO  RLSFA  IITHU  TDENA HASOD HYAEQ  RNTUA  FETRE  TTENR  RITDO  YHNDT  IMOER'

block = ''
blocks = []

for letter in message:
    if letter ==' ':
        if block != '':
            blocks.append(block)
        block=''
    else:
        block += letter

message_blocks = blocks

for i in range(len(max(message_blocks, key=len))+1):
    row=''+str(i)
    for j in key_order:
        row += ' '
        if i == 0:
            row += str(j)
        else:
            try:
                row += message_blocks[j-1][i-1]
            except:
                row += ' '
    print row