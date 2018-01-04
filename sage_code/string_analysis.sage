import re
@interact
def string_count_simple(
                    text=input_box('Place the text that you would like to analyze here!!!', 
                    label="Enter your message", height=3, width=50, type=str),
                    key=input_box('sage', label="String to search", height=1, width=20, type=str)):
    message = re.sub('[^A-Z]','',str(text.encode('ascii','replace')).upper())+" "
    count = 0
    K = re.sub('[^A-Z]',' ',str(key.encode('ascii','replace')).upper())
    N = len(K)
    c=""
    for i in range(len(message)-N+1):
        c = message[i:i+N]
        if c == K: count += 1
    print "Your string appears ",str(count)," times."