@interact
def subset_count(
                    text=input_box('Place the text that you would like to analyze here!!!', 
                    label="Enter your message", height=3, width=50, type=str),
                    Subsets=[1..10]):
    message = AlphabeticStrings().encoding(str(text.encode('ascii','replace').decode()))
    S = Subsets
    sets = [""]*S
    for i in range(0,len(message)):
        sets[i%S] += str(message[i])
    for i in range(S):
        tmp_message = sets[i]
        count = {}
        for i in range(len(tmp_message)):
            c = tmp_message[i:i+1]
            if c in count: count[c] += 1
            else: count[c] = 1
        print("The length of this subset is {}".format(len(tmp_message)))
        count = sorted([(value, key) for key, value in count.items()])
        print("Character\tCount\t\tPercent")
        count.reverse()
        IC = 0
        for c in count[0:min(30,len(count))]:
            if len(c[1])>6: 
                tab="\t"
            else:
                tab="\t\t"
            print(c[1],tab,c[0],"\t\t %.4G" % (c[0]/len(tmp_message)*100.0))
            IC += c[0]*(c[0]-1.0)/len(tmp_message)^2
        print("And, the index of coincidence for this set is %.4G\n" %  (IC))