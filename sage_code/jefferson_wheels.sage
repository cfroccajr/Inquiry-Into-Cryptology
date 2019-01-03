# wheels:
cipher_alphabet0 = "abcdefghijkl&mnopqrstuvwxyz"
cipher_alphabet1 = "qwertyuiopasdfghjklzxcvbnm&"
cipher_alphabet2 = "qazxswe&dcvfrtgbnhyujmkliop"
cipher_alphabet3 = "alskdjhfgqwpoeiuyrt&zxmnbvc"
cipher_alphabet4 = "&alksjhgfdqpoiuytrewmnbvcxz"
cipher_alphabet8 = "zxcvbnmlkjhgfdsa&qwertyuiop"
cipher_alphabet7 = "qazwsxedcrfvtgbyhn&ujmikolp"
cipher_alphabet6 = "qwertyuiopmnbvcxz&laksjdhfg"
cipher_alphabet5 = "zyxwvutsrqponmlkjihgfedcba&"


# cylinder:
cylinder = [cipher_alphabet0,cipher_alphabet1,cipher_alphabet2,cipher_alphabet3,cipher_alphabet4,cipher_alphabet5,cipher_alphabet6,cipher_alphabet7,cipher_alphabet8]

# slider lists
L0 = [cipher_alphabet0[i] for i in range(len(cipher_alphabet0))]
L1 = [cipher_alphabet1[i] for i in range(len(cipher_alphabet1))]
L2 = [cipher_alphabet2[i] for i in range(len(cipher_alphabet2))]
L3 = [cipher_alphabet3[i] for i in range(len(cipher_alphabet3))]
L4 = [cipher_alphabet4[i] for i in range(len(cipher_alphabet4))]
L5 = [cipher_alphabet5[i] for i in range(len(cipher_alphabet5))]
L6 = [cipher_alphabet6[i] for i in range(len(cipher_alphabet6))]
L7 = [cipher_alphabet7[i] for i in range(len(cipher_alphabet7))]
L8 = [cipher_alphabet8[i] for i in range(len(cipher_alphabet8))]


# interactive:
@interact
def _(
        wheel0=("Wheel 0:",slider(L0)),
	    wheel1=("Wheel 1:",slider(L1)),
	    wheel2=("Wheel 2:",slider(L2)),
	    wheel3=("Wheel 3:",slider(L3)),
	    wheel4=("Wheel 4:",slider(L4)),
	    wheel5=("Wheel 5:",slider(L5)),
	    wheel6=("Wheel 6:",slider(L6)),
	    wheel7=("Wheel 7:",slider(L7)),
	    wheel8=("Wheel 8:",slider(L8))
	):
    cylinder_settings=[wheel0,wheel1,wheel2,wheel3,wheel4,wheel5,wheel6,wheel7,wheel8]
    text_plot_sum = text("",(0,0))
    column_index = 3
    for alphabet,character in zip(cylinder,cylinder_settings):
    	temp_wheel = alphabet[alphabet.index(character):]+alphabet[:alphabet.index(character)]
    	row_index=0
    	for i in range(-3,4):
            text_plot_sum += text(str(column_index-3),(column_index,1.5),fontsize=16,color="blue")
            if temp_wheel[i]==character:
    	        text_plot_sum += text(temp_wheel[i].upper(),(column_index,-row_index),fontsize=16,color="red",fontweight="heavy")
            else:
                text_plot_sum += text(temp_wheel[i],(column_index,-row_index),fontsize=16,color="green")
    	    row_index+=1
    	column_index+=1
    text_plot_sum.show(axes=False,aspect_ratio=1,figsize=[4,5])