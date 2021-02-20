import textwrap
import re
@interact
def falconer(message=input_box("The quick brown fox jumps over the lazy sleeping dog.",
                                  label="Message:", type=str, width=50, height=3),
             keys=input_grid(1,6,default=["CBA", "CAB", "ACB", "BCA","BAC",""],
                    label="Keys:", to_value=list, type=str),
            chars=[3..5],
            spaces = selector(['Plain','LaTeX'], buttons=True)):
    text = re.sub('[^A-Z]','',str(message.encode('ascii','replace').decode()).upper())
    columns = "ABCDE"
    key = keys[0]
    while "" in key: key.remove("")
    # Blank Table Array  for Enciphering
    message_table = [["" for x in range(chars)] for y in range(len(key))]
    for i in range(0,len(text),chars):
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
    print("Chracters in text: ",len(text))
    print("Cipher Table:")
    for k in range(len(key)):
        print("\t",str(k+1)," ",str(key[k][0:chars]),":","\t".join(message_table[k]))
        for i in range(chars):
            out_message += str(message_table[k][i])+" "
    print("Completed Message:")
    print(textwrap.fill(out_message, 50))

    if spaces == 'LaTeX':
    # Add LaTeX Formatting
        LaTeX_Table = ""#["" for y in range(len(key))]
    # Create top row
        header_row="\t & "
        for i in range(chars):
            header_row += columns[i] + " & "
        LaTeX_Table += header_row[0:-2] + " \\tabularnewline\n"
    # Add rows of cipher text
        for k in range(len(key)):
            row = str(k+1)+" & "+str(key[k][0:chars])+": & "
            for j in range(chars):
               if j< chars-1:
                   row +=message_table[k][j]+" & "
               else:
                   row += message_table[k][j]+" \\tabularnewline\n"
            LaTeX_Table += row
        print("\nHere are the guts for a LaTeX table:")
        print(LaTeX_Table)