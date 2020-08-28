@interact
def _(message=input_box('EUS HJY TXZ UPE ISE QML COP BEN KVI WHO RRG OTD FL NEG OA',label="Message",type=str,width=50,height=3),
        key_order_str=input_box('1,2,3,4,5,6,7,8,9,10,11,12,13,14,15',label="Column Order",type=str,width=50,height=2)):

    message_blocks = message.split()
    key_order = list(map(int,key_order_str.split(',')))
    print(message_blocks)
    print(key_order)

    for i in range(len(max(message_blocks, key=len))+1):
        row=''+str(i)
        for j in key_order:
            row += ' '
            if i == 0:
                row += str(j)
            else:
                if len(str(j))>1:
                    row += ' '
                try:
                    row += message_blocks[j-1][i-1]
                except:
                    row += ' '
        print(row)