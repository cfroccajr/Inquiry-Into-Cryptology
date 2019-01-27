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
disk_A = list("AHUNFRILTGdMDOQPEXSYJKVWBCZ")
disk_B = list("AEGZRJBQTXCoSLYFPNIVOHKUMDW")

# cylinder:
cylinder = [disk_0,disk_1,disk_2,disk_3,disk_4,disk_5,disk_6,disk_7,disk_8,disk_9,disk_A,disk_B]

# interactive:
@interact(layout={'top': [['wheel0', 'wheel1','wheel2','wheel3'],['wheel4', 'wheel5','wheel6','wheel7'],['wheel8','wheel9','wheelA','wheelB']]})
def _(
        wheel0=selector(disk_0,label="0"),
        wheel1=selector(disk_1,label="1"),
        wheel2=selector(disk_2,label="2"),
        wheel3=selector(disk_3,label="3"),
        wheel4=selector(disk_4,label="4"),
        wheel5=selector(disk_5,label="5"),
        wheel6=selector(disk_6,label="6"),
        wheel7=selector(disk_7,label="7"),
        wheel8=selector(disk_8,label="8"),
        wheel9=selector(disk_9,label="9"),
        wheelA=selector(disk_A,label="10"),
        wheelB=selector(disk_B,label="11")
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