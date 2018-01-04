import textwrap
import re
@interact
def falconer(message=input_box("The quick brown fox jumps over the lazy sleeping dog.",
                                  label="Message:", type=str, width=50, height=3),
             keys=input_grid(1,6,default=["CBA", "CAB", "ACB", "BCA","BAC",""],
                    label="Keys:", to_value=list, type=str),
            chars=[3..5]):
    text = re.sub('[^A-Z]','',str(message.encode('ascii','replace')).upper())
    columns = "ABCDE"
    key = keys[0]
    while "" in key: key.remove("")
    message_table = [["" for x in range(chars)] for y in range(len(key))]
    for i in xrange(0,len(text),chars):
        row = (i/chars)%len(key)
        for j in range(chars):
            try:
                col = columns.index(key[row][j])
            except:
                col = chars-1 #pass
            try:
                message_table[row][col] += str(text[i+j])
            except:
                pass
    out_message = ""
    print "Chracters in text: ",len(text)
    print "Cipher Table:"
    for k in range(len(key)):
        print "\t",str(key[k][0:chars]),":\t","\t".join(message_table[k])
        for i in range(chars):
            out_message += str(message_table[k][i])+" "
    print "Completed Message:"
    #for i in xrange(0,len(out_message),50):
    #    print "\t",out_message[i:min(i+50,len(out_message))].strip()
    print textwrap.fill(out_message, 50)