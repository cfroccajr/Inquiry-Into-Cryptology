IP=[1,5,2,0,3,7,4,6]
IPI = [3,0,2,4,6,1,7,5]
E = [3,0,1,2,1,2,3,0]
P = [1,3,2,0]
s1= [["01","11","10","11"],["11","10","01","00"],["00","10","01","11"],["11","01","11","10"]]
s2= [["00","01","10","11"],["10","00","01","11"],["11","00","01","00"],["10","01","10","11"]]
K="11100111100101010001001110001001"

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
	K_nib = bit_add(E_nib,key)
	Sp_nib=split(K_nib)
	S1_nib=sbox_lookup(Sp_nib[0])
	S2_nib=sbox_lookup(Sp_nib[1],s2)
	f_nib = permute(S1_nib+S2_nib,P)
	return f_nib

def rsDES(M="10111100",rnds=2,strnd=0):
	print("Original Message: %s"% M)
	IP_M = permute(M,IP)
	L=split(IP_M)[0]
	R=split(IP_M)[1]
	print("Permuted Message: %s %s" %(L,R))
	for r in range(strnd,strnd+rnds):
		print("Round %d:"%r)
		rnd_key=get_rnd_key(r)
		print("\tRound Key:%s" %rnd_key)
		# print("\t",L,R)
		fR = round_f(R,rnd_key)
		print("\tf(%s,%s)=%s" %(R,rnd_key,fR))
		temp_L=L
		L=R
		R=bit_add(temp_L,fR)
		print("\tNew L=%s, R=%s" %(L,R))
	IPI_RL = permute(R+L,IPI)
	print("Enciphered Message: %s" %IPI_RL)
	return IPI_RL

m2="10111100"
print(split(permute(m2,IP)))
print(rsDES(m2,2,2))