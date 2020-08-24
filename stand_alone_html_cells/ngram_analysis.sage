
<div class="compute"><script type="text/x-sage">

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
        message = re.sub('[\W]|[_]','',message)
    message = re.sub('\s+','',message)
    count = {}
    for i in range(len(message)-N+1):
        c = message[i:i+N]
        if c in count: count[c] += 1
        else: count[c] = 1
    print "The length of your message is {} characters".format(len(message))
    count = sorted([(value, key) for key, value in count.items()])
    print "\tRank\tN-Gram\tCount\tPercent"
    count.reverse()
    rank = 1
    for c in count[0:min(30,len(count))]:
        if len(c[1])>6: 
            tab=" "
        else:
            tab="\t"
        print str("\t"+str(rank)+"."),tab,c[1],tab,c[0],"\t %.4G" % (c[0]/len(message)*100.0)
        rank += 1
    if len(count)==26 and N==1 and mode=='Alpha Only': print "Pangram!!!"

</script></div>