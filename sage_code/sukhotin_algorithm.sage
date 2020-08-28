# This SageMath Cell implements Sukhotin's Algorithm.  
# To do so it views the inputed string as a graph; 
# develops a list of nodes and sets up a dictionary 
# for the adjacency matrix.

import re

def sukhotin(key,weights,edges):
    for node in weights:
        weights[node] = weights[node]-2*edges.get(key+node,0)
        weights[node] = weights[node]-2*edges.get(node+key,0)
    return weights

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