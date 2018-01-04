import re
@interact
def word_count_simple(
                    text=input_box('Place the text that you would like to analyze here!!!', 
                    label="Enter your message", height=3, width=50, type=str)):
    message = re.sub('[^A-Z]',' ',str(text.encode('ascii','replace')).upper())+" "
    count = {}
    words = 0
    c=""
    for l in message:
        if l==" ":
            if c in count:
                words += 1 
                count[c] += 1
            elif c!="": 
                count[c] = 1
                words += 1
            c=""
        else: c=c+l
    print "The total number of words in your message is {}".format(words)
    print "The number of distinct words in your message is {}".format(len(count))
    count = sorted([(value, key) for key, value in count.items()])
    print "Word\t\tCount\t\tPercent"
    count.reverse()
    for c in count[0:min(30,len(count))]:
        if len(c[1])>6: 
            tab="\t"
        else:
            tab="\t\t"
        print c[1],tab,c[0],"\t\t %.4G" % (c[0]/words*100.0)