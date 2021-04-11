def f_round(left_nibble,right_nibble,key):
	try:
		temp_right = right_nibble
		right_nibble = format(int(left_nibble,base=2)^^int(right_nibble,base=2)^^int(key,base=2),'b')
		if len(right_nibble)%4!=0:
			right_nibble = "0"*(4-len(right_nibble)%4)+right_nibble
		left_nibble = temp_right
		if len(left_nibble)%4!=0:
			left_nibble = "0"*(4-len(left_nibble)%4)+left_nibble
		return [left_nibble,right_nibble]
	except:
		print(sys.exc_info())
@interact
def _(
    ln=input_box("0011",type=str,height=1,width=5,label="Left:"),
    rn=input_box("0100",type=str,height=1,width=5,label="Right:"),
    key=input_box("1100",type=str,height=1,width=5,label="key:"),
    ):
    round_output=f_round(ln,rn,key)
    print("Using L=%s, R=%s, k=%s, and the function\n\t\t L\u2295f(R,k)=L\u2295R\u2295k," %(ln,rn,key))
    print("the new left half is %s and the new right half is %s" %(round_output[0],round_output[1])) 
    