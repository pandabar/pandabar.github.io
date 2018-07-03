#Vowel continuum maker#
#By Fernanda Barrientos + Henri Kauhanen, who's incredibly unhappy about repeating the loop#
#University of Manchester#

#Description: creates a 7-step continuum from a source original vowel sound
#and the values of a target vowel sound 




#Directories

sound_directory$ = "/Users/mfbxkfb2/Desktop/definitivo2/vowels2"
out_directory$ = "/Users/mfbxkfb2/Desktop/continua3"

#Formant values. Enter F1 and F2 of target vowels here.

	#Spanish vowels
	a_f1 = 935
	a_f2 = 1548
	e_f1 = 609
	e_f2 = 2263
	i_f1 = 489
	i_f2 = 2864
	o_f1 = 597
	o_f2 = 966
	u_f1= 460
	u_f2 = 982

	#English vowels
	as_f1 = 964
	as_f2 = 1296
	#ae_f1 = 844
	#ae_f2 = 1060
	hs_f1 = 379
	hs_f2 = 1154
	ic_f1 = 485
	ic_f2 = 2236
	vt_f1 = 814
	vt_f2 = 1684

#Reading files

strings = Create Strings as file list: "list", sound_directory$ + "/*.wav"
numberOfFiles = Get number of strings


for ifile to numberOfFiles
	selectObject: strings
	filename$ = Get string... ifile
	wav_file = Read from file: sound_directory$ + "/" + filename$

	#Preliminary tasks: resample and peak scaling
	wav_file_resampled = Resample... 11000 50
	Scale peak... 0.99
	
	#LPC to get source
	lpc= To LPC (autocorrelation): 16, 0.025, 0.005, 50
	selectObject: wav_file_resampled
	plus lpc
	Filter (inverse)
	Rename... source
	
	dif_f1 = 0
	dif_f2 = 0
	targetname$ = ""

	#End 1: Calculating reference values
	if filename$ == "as.wav"
		dif_f1 = as_f1 - a_f1
		dif_f2 = as_f2 - a_f2
		targetname$ = "a"
	#elsif filename$ == "ae.wav"
		#dif_f1 = ae_f1 - a_f1
		#dif_f2 = ae_f2 - a_f2
		#targetname$ = "a"
	elsif filename$ == "hs.wav"
		dif_f1 = hs_f1 - o_f1
		dif_f2 = hs_f2 - o_f2
		targetname$ = "o"
	elsif filename$ == "ic.wav"
		dif_f1 = ic_f1 - i_f1
		dif_f2 = ic_f2 - i_f2
		targetname$ = "i"
	elsif filename$ == "vt.wav"
		dif_f1 = vt_f1 - a_f1
		dif_f2 = vt_f2 - a_f2
		targetname$ = "a"
	endif
	
	name$ = replace_regex$ (filename$, ".wav", "", 0)
	for i from 1 to 7
		selectObject: wav_file_resampled
		formant_id = To Formant (burg): 0, 5, 5500, 0.015, 50
		selectObject: formant_id

		Formula (frequencies): "if row = 1 then self + (-(dif_f1/6) * (i-1)) else self fi"
		Formula (frequencies): "if row = 2 then self + (-(dif_f2/6) * (i-1)) else self fi"
		selectObject: "Sound source"
		plus formant_id
		Filter
		selectObject: "Sound source_filt"
		Rename... token'i'
		Write to WAV file... 'out_directory$'/'name$'_'targetname$'_'i'.wav
		select formant_id	
		Remove
	endfor
	
endfor
select all
minus strings
Remove

for ifile to numberOfFiles
	selectObject: strings
	filename$ = Get string... ifile
	wav_file = Read from file: sound_directory$ + "/" + filename$

	#Preliminary tasks: resample and peak scaling
	wav_file_resampled = Resample... 11000 50
	Scale peak... 0.99
	
	#LPC to get source
	lpc= To LPC (autocorrelation): 16, 0.025, 0.005, 50
	selectObject: wav_file_resampled
	plus lpc
	Filter (inverse)
	Rename... source
	
	dif_f1 = 0
	dif_f2 = 0
	targetname$ = ""

	#End 2: Calculating reference values
	if filename$ == "as.wav"
		dif_f1 = as_f1 - o_f1
		dif_f2 = as_f2 - o_f2
		targetname$ = "o"
	#elsif filename$ == "ae.wav"
	#	dif_f1 = ae_f1 - e_f1
	#	dif_f2 = ae_f2 - e_f2
	#	targetname$ = "e"
	elsif filename$ == "hs.wav"
		dif_f1 = hs_f1 - u_f1
		dif_f2 = hs_f2 - u_f2
		targetname$ = "u"
	elsif filename$ == "ic.wav"
		dif_f1 = ic_f1 - e_f1
		dif_f2 = ic_f2 - e_f2
		targetname$ = "e"
	elsif filename$ == "vt.wav"
		dif_f1 = vt_f1 - o_f1
		dif_f2 = vt_f2 - o_f2
		targetname$ = "o"
	endif
	

	name$ = replace_regex$ (filename$, ".wav", "", 0)
	for i from 1 to 7
		selectObject: wav_file_resampled
		formant_id = To Formant (burg): 0, 5, 5500, 0.015, 50
		selectObject: formant_id

		Formula (frequencies): "if row = 1 then self + (-(dif_f1/6) * (i-1)) else self fi"
		Formula (frequencies): "if row = 2 then self + (-(dif_f2/6) * (i-1)) else self fi"
		selectObject: "Sound source"
		plus formant_id
		Filter
		selectObject: "Sound source_filt"
		Rename... token'i'
		Write to WAV file... 'out_directory$'/'name$'_'targetname$'_'i'.wav
		select formant_id	
		Remove
	endfor
select all
minus strings
Remove
endfor

for ifile to numberOfFiles
	selectObject: strings
	filename$ = Get string... ifile
	wav_file = Read from file: sound_directory$ + "/" + filename$

	#Preliminary tasks: resample and peak scaling
	wav_file_resampled = Resample... 11000 50
	Scale peak... 0.99
	
	#LPC to get source
	lpc= To LPC (autocorrelation): 16, 0.025, 0.005, 50
	selectObject: wav_file_resampled
	plus lpc
	Filter (inverse)
	Rename... source
	
	dif_f1 = 0
	dif_f2 = 0
	targetname$ = ""
	#English-to-English: Calculating reference values
	if filename$ == "as.wav"
		dif_f1 = as_f1 - vt_f1
		dif_f2 = as_f2 - vt_f2
		targetname$ = "vt"
	elsif filename$ == "hs.wav"
		dif_f1 = hs_f1 - ic_f1
		dif_f2 = hs_f2 - ic_f2
		targetname$ = "ic"
	endif


	name$ = replace_regex$ (filename$, ".wav", "", 0)
	for i from 1 to 7
		selectObject: wav_file_resampled
		formant_id = To Formant (burg): 0, 5, 5500, 0.015, 50
		selectObject: formant_id

		Formula (frequencies): "if row = 1 then self + (-(dif_f1/6) * (i-1)) else self fi"
		Formula (frequencies): "if row = 2 then self + (-(dif_f2/6) * (i-1)) else self fi"
		selectObject: "Sound source"
		plus formant_id
		Filter
		selectObject: "Sound source_filt"
		Rename... token'i'
		Write to WAV file... 'out_directory$'/'name$'_'targetname$'_'i'.wav
		select formant_id	
		Remove
	endfor

endfor
select all
minus strings
Remove