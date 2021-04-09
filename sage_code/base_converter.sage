import math

@interact
def _(
    value=input_box(256, label="Value:", height=1,width=12, type=int),
    b=input_box(10,type=int,height=1,width=12,label="From Base:"),
    B=input_box(2,type=int,height=1,width=12,label="To Base:")):
    print("Convert %s from base %s to base %s:" %(value,b,B))
    try:
        n=int(str(value),base=b)
        digits={}
        maxpower=math.floor(math.log(n,B))
        while n!=0:
            p=math.floor(math.log(n,B))
            d=n//(B**p)
            n=n-d*(B**p)
            digits[str(p)]=d
        output=""
        for i in range(int(maxpower)+1):
            output = str(digits.get(str(i),0))+" "+output
        print("Output Value:",output)
    except:
        print("Error in conversion, are you sure %s is in base %d" %(value,b))