import re

@interact
def ngram_count_simple(
                    text=input_box('Place the text that you would like to analyze here!!!', 
                    label="Enter your message", height=5, width=50, type=str),N=[1..6],
                    mode=selector(['All Characters','Alpha-Numeric','Alpha Only'],buttons=True)):
    message = text.upper()
    if mode == 'Alpha Only':
        message = re.sub('[^A-Z]','',message)
    elif mode=='Alpha-Numeric':
        message = re.sub('[\\W]|[_]','',message)
    message = re.sub('\\s+','',message)
    count = {}
    for i in range(len(message)-N+1):
        c = message[i:i+N]
        if c in count: count[c] += 1
        else: count[c] = 1
    print("The length of your message is {} characters".format(len(message)))
    count = sorted([(value, key) for key, value in count.items()])
    print("\tRank\tN-Gram\tCount\tPercent")
    count.reverse()
    rank = 1
    alphabet="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    for c in count[0:min(30,len(count))]:
        alphabet=alphabet.replace(c[1],"")
        if len(c[1])>6: 
            tab=" "
        else:
            tab="\t"
        print(str("\t"+str(rank)+"."),tab,c[1],tab,c[0],"\t %.4G" % (c[0]/len(message)*100.0))
        rank += 1
    if N==1:
        if alphabet=="": 
            print("Pangram!!! Congratulations you used all your letters.")
        else:
            temp_str=""
            for ch in alphabet:
                temp_str+=ch+", "
            print("Characters not in this text:",temp_str[0:-2])



<!--         print("Character & Count & Percent")
        count.reverse()
        IC = 0
        for c in count[0:min(30,len(count))]:
            if len(c[1])>6: 
                tab=" & "
            else:
                tab=" & "
            print(c[1],tab,c[0]," & %.4G" % (c[0]/len(tmp_message)*100.0),"\\tabularnewline")
            IC += c[0]*(c[0]-1.0)/len(tmp_message)^2
        print("And, the index of coincidence for this set is %.4G\n" %  (IC)) -->