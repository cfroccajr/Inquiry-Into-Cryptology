import re
@interact
def word_count_simple(
                    text=input_box('Place the text that you would like to analyze here!!!', 
                    label="Enter your message", height=3, width=50, type=str),
                    nWords=input_box(30,height=1,width=4,label="Number of Words",type=int)):
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
    print "Word\t\tCount\t\tPercent\t\tTotal Percent"
    count.reverse()
    totalPercent=0
    for c in count[0:min(nWords,len(count))]:
        if len(c[1])>6: 
            tab="\t"
        else:
            tab="\t\t"
        percent=(c[0]/words*100.0)
        if percent>1:
            tab2="\t\t"
        else:
            tab2="\t"
        totalPercent+=percent
        print c[1],tab,c[0],"\t\t %.4G" % percent,tab2,"%.4G" % totalPercent