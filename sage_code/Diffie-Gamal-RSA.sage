# This SageMath Cell implements The Diffie-Helman,
# the ElGamal, and RSA Crypto Systems

import re,math
from sympy.ntheory import isprime

def RSA_Keys(p,q,e):
    All_Keys = [p,q]
    N=p*q
    phiN=(p-1)*(q-1)
    if isprime(p) and isprime(q) and gcd(e,phiN)==1:
        All_Keys.append(N)
        All_Keys.append(phiN)
        d=mod(e^-1,phiN)
        All_Keys.append(d)
    else:
        print("Invalid Seeds")
    return All_Keys





@interact
def sukhotin_algorithm(text=input_box('Place the text that you would like to analyze here!!!',label="Enter your message", height=3, width=84, type=str)): 
                       
# Clean up the input string
    graph = re.sub('[^a-z]',"",str(text.encode('ascii','replace').decode()).lower())

# Set up the initial list of nodes and the modified adjacency matrix
    node_weights={}
    edges={}
    previous_node = graph[-1]

    for node in graph:
        if previous_node != node:
            edge = previous_node+node
            node_weights[node] = node_weights.get(node,0)+2
            edges[edge] = edges.get(edge,0)+1
        previous_node = node

# Run through Sukhotin's algorithm to identify potential vowels
    vowels = []
    while max(node_weights.values())>0:
        vowel = max(node_weights, key=node_weights.get)
        vowels.append(vowel)
        del node_weights[vowel]
        node_weights = sukhotin(vowel,node_weights,edges)

# Output the results of the algorithm
    print("These are the list of potential vowels in your text:\n\t",vowels)
    print("These are the letters that are left:\n\t",node_weights.keys())