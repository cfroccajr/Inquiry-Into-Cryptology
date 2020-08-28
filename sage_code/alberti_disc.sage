# constants:
plain_alphabet = "ABCDEFGILMNOPQRSTVXZ1234"
cipher_alphabet = "acegklnprtvz&xysomqihfdb"
U = [plain_alphabet[i] for i in range(len(plain_alphabet))]
L = [cipher_alphabet[i] for i in range(len(cipher_alphabet))]


# interactive:
@interact
def _(Key=("Key Letter",slider(U)),
      index_letter=("Index Letter",slider(L))):
    alpha_len = min(len(plain_alphabet),len(cipher_alphabet))
    angle = 2*pi/alpha_len
    #print Key,index_letter
    text_plot_sum = text("",(0,0))
    radius=1
    index1 = cipher_alphabet.index(index_letter)
    index2 = plain_alphabet.index(Key)
    index = index1-index2
    #print index
    for i in range(alpha_len):
        if cipher_alphabet[i]==index_letter:
            text_plot_sum += text(cipher_alphabet[i],(radius*cos(-angle*i),radius*sin(-angle*i)),rotation=-90-180/pi*angle*i,axes="none",fontsize=16,color="green",fontweight="heavy")
            text_plot_sum += text(plain_alphabet[(i-index)%alpha_len],(1.25*radius*cos(-angle*i),1.25*radius*sin(-angle*i)),rotation=-90-180/pi*angle*i,axes="none",fontsize=16,color="green",fontweight="heavy")
        else:
            text_plot_sum += text(cipher_alphabet[i],(radius*cos(-angle*i),radius*sin(-angle*i)),rotation=-90-180/pi*angle*i,axes="none",fontsize=16)
            text_plot_sum += text(plain_alphabet[(i-index)%alpha_len],(1.25*radius*cos(-angle*i),1.25*radius*sin(-angle*i)),rotation=-90-180/pi*angle*i,axes="none",fontsize=16,color="red")
    text_plot_sum.show(axes=False,aspect_ratio=1,figsize=[4,4])