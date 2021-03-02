<!--         print("Character & Count & Percent")
        count.reverse()
        IC = 0
        for c in count[0:min(30,len(count))]:
            if len(c[1])>6: 
                tab=" & "
            else:
                tab=" & "
            print(c[1],tab,c[0]," & %.4G" % (c[0]/len(tmp_message)*100.0),"\\tabularnewline")
            IC += c[0]*(c[0]-1.0)/len(tmp_message)^2
        print("And, the index of coincidence for this set is %.4G\n" %  (IC)) -->