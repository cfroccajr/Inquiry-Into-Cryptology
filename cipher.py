def ngram_count_simple(text,N=1):
    ''' if N=1, return a dict containing each letter along with how many times the letter occurred.
        if N=2, returns a dict containing counts of each bigram (pair of letters)
        etc.
        There is an option to remove all spaces and punctuation prior to processing '''
    text = text.upper()
    count = {}
    for i in range(len(text)-N+1):
        c = text[i:i+N]
        if c in count: count[c] += 1
        else: count[c] = 1
    return [count,len(text)]