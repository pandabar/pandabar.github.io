f1e = hertzToMel(450)
f2e = hertzToMel(2300)
f3e = hertzToMel(3000)
f4e = hertzToMel(4440)
#Giving /a/ values
f1a = hertzToMel(700)
f2a = hertzToMel(1450)
f3a = hertzToMel(2800)
f4a = hertzToMel(4200)

stepf1_mel= (f1a-f1e)/9
stepf2_mel= (f2e-f2a)/9
stepf3_mel= (f3e-f3a)/9
stepf4_mel= (f4e-f4a)/9

writeInfoLine: "Vowel", tab$, "F1_Mel", tab$, "F2_Mel", tab$, "F3_Mel", tab$, "F4_Mel"
for i from 1 to 10
appendInfoLine: i, tab$, f1a-(stepf1_mel*(i-1)), tab$, f2a+(stepf2_mel*(i-1)), tab$, f3a+(stepf3_mel*(i-1)), tab$, f4a+(stepf4_mel*(i-1))
endfor
appendFile("/home/fernanda/Desktop/Essex/mel.txt", info$())

#Reading table with values
	meltable=Read Table from tab-separated file: "/home/fernanda/Desktop/Essex/mel.txt" 
	nrow=Get number of rows
#create new table
writeInfoLine: "Vowel", tab$, "F1MeltoHz", tab$, "B1", tab$, "F2MeltoHz", tab$, "B2", tab$, "F3MeltoHz", tab$, "B3", tab$, "F4MeltoHz", tab$, "B4"
#Main loop - Create resynthesized sounds from the values on the table
selectObject: "Table mel"
	for irow from 1 to 10
		f1= Get value... irow F1_Mel
		f2= Get value... irow F2_Mel
		f3= Get value... irow F3_Mel
		f4= Get value... irow F4_Mel
appendInfoLine: irow, tab$, melToHertz(f1), tab$, 50, tab$, melToHertz(f2), tab$, 70, tab$, melToHertz(f3), tab$, 100, tab$, melToHertz(f4), tab$, 140
endfor
appendFile("/home/fernanda/Desktop/Essex/meltohz.txt", info$())

