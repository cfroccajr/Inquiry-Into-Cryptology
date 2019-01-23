# wheels:
disk_0 = list("A0LOVTZSMHNJRUIEWCDQPKBYGXF")
disk_1 = list("AXZTKYMHPESDURFLWIVOGNBQ1JC")
disk_2 = list("AJDWQIYCFXMUSGLBZTH2RVENKPO")
disk_3 = list("AEVDQULIBSJ3HNPFWMYKGXCZTRO")
disk_4 = list("AHUNFRILTG4MDOQPEXSYJKVWBCZ")
disk_5 = list("AEUMDGZRJBQTXC5SLYFPNIVOHKW")
disk_6 = list("A6LOVTZSMHNJRUIEWCDQPKBYGXF")
disk_7 = list("AXZTKYMHPESDURFLWIVOGNBQ7JC")
disk_8 = list("AJDWQIYCFXMUSGLBZTH8RVENKPO")
disk_9 = list("AEVDQULIBSJ9HNPFWMYKGXCZTRO")
disk_10 = list("AHUNFRILTGdMDOQPEXSYJKVWBCZ")
disk_11 = list("AEGZRJBQTXCoSLYFPNIVOHKUMDW")

# cylinder:
cylinder = [disk_0,disk_1,disk_2,disk_3,disk_4,disk_5,disk_6,disk_7,disk_8,disk_9,disk_10,disk_11]

# interactive:
@interact
def _(
        wheel0=("Wheel 0:",slider(disk_0)),
        wheel1=("Wheel 1:",slider(disk_1)),
        wheel2=("Wheel 2:",slider(disk_2)),
        wheel3=("Wheel 3:",slider(disk_3)),
        wheel4=("Wheel 4:",slider(disk_4)),
        wheel5=("Wheel 5:",slider(disk_5)),
        wheel6=("Wheel 6:",slider(disk_6)),
        wheel7=("Wheel 7:",slider(disk_7)),
        wheel8=("Wheel 8:",slider(disk_8)),
        wheel9=("Wheel 9:",slider(disk_9)),
        wheelA=("Wheel 10:",slider(disk_10)),
        wheelB=("Wheel 11:",slider(disk_11))
    ):
    args=locals()
    text_plot_sum = text("",(0,0))
    column_index = 3
    for alphabet,wheel in zip(cylinder,sorted(args)):
        character = args[wheel]
        temp_wheel = alphabet[alphabet.index(character):]+alphabet[:alphabet.index(character)]
        row_index=0
        for i in range(-3,4):
            column_head = (column_index-3)/2
            text_plot_sum += text(str(column_head),(column_index,1.5),fontsize=16,color="blue")
            if temp_wheel[i]==character:
                text_plot_sum += text(temp_wheel[i],(column_index,-row_index),fontsize=16,color="red",fontweight="heavy")
            else:
                text_plot_sum += text(temp_wheel[i],(column_index,-row_index),fontsize=16,color="green")
            row_index+=2
        column_index+=2
    text_plot_sum.show(axes=False,aspect_ratio=1,figsize=[5,5])