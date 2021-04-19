import re
import sys


IP=[1,5,2,0,3,7,4,6]
IPI = [3,0,2,4,6,1,7,5]
E = [3,0,1,2,1,2,3,0]
P = [1,3,2,0]
s1= [["01","11","10","11"],["11","10","01","00"],["00","10","01","11"],["11","01","11","10"]]
s2= [["00","01","10","11"],["10","00","01","11"],["11","00","01","00"],["10","01","10","11"]]
K="11100111100101010001001110001001"

def ch_to_bits(matchobj):
	try:
		return format(ord(matchobj.group(0)),'b')
	except:
		print(sys.exc_info())
def to_bit(input_str):
	try:
		return re.sub('.{1}',ch_to_bits,input_str)
	except:
		print(sys.exc_info())
def to_nibbles(bit_str):
	try:
		return [match.group(1) for match in re.finditer('(?=([01]{4}))',bit_str)]
	except:
		print(sys.exc_info())
def to_bytes(input_str):
	bit_str = to_bit(input_str)
	bit_str = "0"*(8-len(bit_str)%8)+bit_str
	return [match.group(1) for match in re.finditer('([01]{8})',bit_str)]

def get_rnd_key(rnd=0,key=K):
	return key[rnd:rnd+8]

def permute(input,key=IP):
	if len(input)!=len(key):
		print("Length mismatch")
		return input
	try:
		output=""
		for k in key:
			output+=input[k]
		return output
	except:
		print("There were issues")
		return input

def split(input):
	pos=len(input)//2
	return [input[:pos],input[pos:]]

def expand(input):
	return permute(input+input,E)

def bit_add(input1,input2):
	output = ""
	for b,c in zip(input1,input2):
		output += str((int(b,base=2)+int(c,base=2))%2)
	return output

def sbox_lookup(nib,box=s1):
	row=int(nib[:2],base=2)
	col=int(nib[2:],base=2)
	return box[row][col]

def round_f(nib,key="11100111"):
	E_nib=expand(nib)
	print("\t\tExpanded nibble %s" %E_nib)
	K_nib = bit_add(E_nib,key)
	print("\t\tSum with key %s" %K_nib)
	Sp_nib=split(K_nib)
	S1_nib=sbox_lookup(Sp_nib[0])
	S2_nib=sbox_lookup(Sp_nib[1],s2)
	print("\t\tCrumbs from s-boxes %s and %s" %(S1_nib,S2_nib))
	f_nib = permute(S1_nib+S2_nib,P)
	return f_nib

def rsDES(M="10111100",rnds=2,strnd=0,decipher=False,key=K):
	if decipher:
		step=-1
	else:
		step=1
	start = strnd + (step-1)//2*(1-rnds)
	stop = start+step*rnds
	print("Original Message: %s"% M)
	# Permute and Split the Message
	IP_M = permute(M,IP)
	L=split(IP_M)[0]
	R=split(IP_M)[1]
	print("Permuted Message: %s %s" %(L,R))
	for r in range(start,stop,step):
		#  Rounds including Round Function
		print("Round %d:"%r)
		rnd_key=get_rnd_key(r,key)
		print("\tRound Key:%s" %rnd_key)
		print("\tBegin the round function:")
		fR = round_f(R,rnd_key)
		print("\tf(%s,%s)=%s" %(R,rnd_key,fR))
		temp_L=L
		L=R
		R=bit_add(temp_L,fR)
		print("\tNew L=%s, R=%s" %(L,R))
	# Final Swap
	print("Final Swap:\n\tNew L=%s, R=%s" %(R,L))
	# Inverse permuation
	IPI_RL = permute(R+L,IPI)
	print("Enciphered Message: %s\n" %IPI_RL)
	return IPI_RL

# m2="10111100"
# c2=rsDES(m2,2,2)
# rsDES(c2,2,2,True)

# m3="11100101"
# c3=rsDES(m3,2,4)
# rsDES(c3,2,4,True)

# m4="0"+format(ord("s"),"b")
# C4=rsDES(m4,2,6)
# rsDES(C4,2,6,True)

k2="111001001000100010001111000100"
hi_bytes=to_bytes("hi")
print("hi=%s" %str(to_bytes("hi")))
M1=hi_bytes[0]
rsDES(M1,2,0,False,k2)
M2=hi_bytes[1]
rsDES(M2,2,2,False,k2)
get_rnd_key(1,k2)