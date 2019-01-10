import random
import numpy

number = random.randint(2,210)

@interact
def factor_practice(
    solution = selector(['Hide Solution','Show Solution'], buttons=True),
    problem = selector(['Current','New'], buttons=True)):
    global number
    print "Try to find the factors of =",number
    if solution=='Show Solution':
        print factor(number)
    if problem == 'New':
        solution = 'Hide Solution'
        number = random.randint(2,210)
        problem ="Current"
        factor_practice()
