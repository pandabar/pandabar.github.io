#open file
vowel = Read from file: "vowela5.wav"
#Resampling
vowel_res = Resample... 11000 50
Scale peak... 0.99
#Here we take the formant frequencies from the vowel
vowel_lpc = To LPC (autocorrelation): 16, 0.025, 0.005, 50
#and now we reverse-filter the sound
selectObject: vowel_res
plus vowel_lpc
Filter (inverse)
#And we rename it in order to make things clearer.
Rename... vowel_source
#Reading table with values
myTable=Read Table from tab-separated file: "meltohz.txt"
nrow=Get number of rows
out_directory$ = "/home/fernanda/Desktop/Essex/continuum/"
#Main loop - Create resynthesized sounds from the Table values
for irow from 1 to nrow
f1= Get value... irow F1MeltoHz
f1bw = Get value... irow B1
f2= Get value... irow F2MeltoHz
f2bw= Get value... irow B2
f3= Get value... irow  F3MeltoHz
f3bw= Get value... irow B3
f4= Get value... irow F4MeltoHz
f4bw= Get value... irow B4
selectObject: vowel_res
formants_'irow'= To Formant (burg): 0.005, 5, 5000, 0.025, 50
Formula (frequencies): "if row = 1 then f1 else self fi"
Formula (bandwidths): "if row = 1 then f1bw else self fi"
Formula (frequencies): "if row = 2 then f2 else self fi"
Formula (bandwidths): "if row = 2 then f2bw else self fi"
Formula (frequencies): "if row = 3 then f3 else self fi"
Formula (bandwidths): "if row = 3 then f3bw else self fi"
Formula (frequencies): "if row = 4 then f4 else self fi"
Formula (bandwidths): "if row = 4 then f4bw else self fi"	
selectObject: "Sound vowel_source"
plusObject: formants_'irow'
Filter
Rename... token_'irow'
Save as WAV file... 'out_directory$'tabletoken_'irow'.wav
selectObject: myTable
endfor

