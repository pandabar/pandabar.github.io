#Define target folder (where my created sounds will land)
out_directory$ ="continuum/"
#Define continuum endopints in Hz
#Giving /e/ values
f1_e = 450
f2_e = 2300
f3_e = 3000
f4_e = 4440
#Giving /a/ values
f1_a = 700
f2_a = 1450
f3_a = 2800
f4_a = 4200
#Now we calculate the distances between endpoints in Hz
dif_f1= f1_a-f1_e
dif_f2= f2_e-f2_a
dif_f3= f3_e-f3_a
dif_f4= f4_e-f4_a
#open file
vowel = Read from file: "vowela5.wav"
#Resampling
vowel_res = Resample... 11000 50
Scale peak... 0.99
#Here we take the formant frequencies from the vowel
vowel_lpc = To LPC (burg): 16, 0.025, 0.005, 50
#and now we reverse-filter the sound
selectObject: vowel_res
plus vowel_lpc
Filter (inverse)
#And we rename it in order to make things clearer.
Rename... vowel_source
#refilter loop
for i from 1 to 10
#get the formants of my original vowel
selectObject: vowel_res
formant_id = To Formant (burg): 0, 5, 5500, 0.025, 50
selectObject: formant_id
#change the values of the original vowel to those for the corresponding step
Formula (frequencies): "if row=1 then self - ((dif_f1/9)*(i-1)) else self fi"
Formula (bandwidths): "if row=1 then 50 else self fi"
Formula (frequencies): "if row=2 then self + ((dif_f2/9)*(i-1)) else self fi"
Formula (bandwidths): "if row=1 then 70 else self fi"
Formula (frequencies): "if row=3 then self + ((dif_f3/9)*(i-1)) else self fi"
Formula (bandwidths): "if row=1 then 100 else self fi"
Formula (frequencies): "if row=4 then self + ((dif_f4/9)*(i-1)) else self fi"
Formula (bandwidths): "if row=1 then 140 else self fi"
#take the source and filter it through these new formant values
selectObject: "Sound vowel_source"
plus formant_id
Filter
selectObject: "Sound vowel_source_filt"
Rename... token'i'
#save as .wav file
Save as WAV file... 'out_directory$'token'i'.wav
select formant_id
Remove
endfor