import re
@interact
def string_count_simple(
                    text=input_box('Place the text that you would like to analyze here!!!', 
                    label="Enter your message", height=3, width=50, type=str),
                    key=input_box('sage', label="String to search", height=1, width=20, type=str),
                    spaces = selector(['yes','no'], buttons=True)
                    ):
    message = re.sub('[^A-Z]',' ',str(text.encode('ascii','replace').decode()).upper())+" "
    message = re.sub('\\s+',' ',message)
    if spaces=='no':
        message = re.sub('\\s+','',message)
    print("This is what your cleaned up message looks like:\n\n",message[0:min(60,len(message))],"...\n\nis this what you intended?\n")
    count = 0
    K = re.sub('[^A-Z]',' ',str(key.encode('ascii','replace').decode()).upper())
    N = len(K)
    c=""
    for i in range(len(message)-N+1):
        c = message[i:i+N]
        if c == K: 
            count += 1
            print("Instance",str(count),"\t",message[max(i-2,0):min(i+N+2,len(message))])
    print("\nYour string appears ",str(count)," times.")