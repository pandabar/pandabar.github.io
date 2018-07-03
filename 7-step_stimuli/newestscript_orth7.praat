#Continuum creator
#By Fernanda Barrientos 
#Creates synthesized 7-step vowel continua with Klatt grids.
#Vowels created after Hillenbrand et al (1995).

#Target directory
out_directory$ = "/test"

myStrings = Read Strings from raw text file... strings.txt
numberOfStrings = Get number of strings

#define vowels
ef_f0= 214
ef_f1= 731
ef_f2= 2058
ef_f3= 2979
ef_f4= 4294

ae_f0= 215
ae_f1= 669
ae_f2= 2349
ae_f3= 2972
ae_f4= 4290

as_f0= 215
as_f1= 936
as_f2= 1551
as_f3= 2815
as_f4= 4299

vt_f0= 218
vt_f1= 753
vt_f2= 1426
vt_f3= 2933
vt_f4= 4092

#KLATT GRID CREATION

#FIRST LOOP: CHOOSING CONTINUA
for iString to numberOfStrings
select myStrings
cont$ = Get string... iString

	if cont$ == "asvt"
	#/b_k/
		f0 = as_f0
		f1startval = as_f1
		f2startval = as_f2
		f3startval = as_f3
		f4startval = as_f4
		dif_f1 = as_f1 - vt_f1
		dif_f2 = as_f2 - vt_f2
		dif_f3 = as_f3 - vt_f3
		dif_f4 = as_f4 - vt_f4
		onsetlocus = 700
		onsfffp = 2500
		onsffbp = 2000
		onsburstlength = 0.031
		codalocus = 3200
		codafffp = 2500
		codaffbp = 100
		codaburstlength = 0.34
		voicingPoint2 = 0.04
		voicingPoint6 = 0
	elsif cont$ == "asae"
	#/p_b/
		f0 = as_f0
		f1startval = as_f1
		f2startval = as_f2
		f3startval = as_f3
		f4startval = as_f4
		dif_f1 = as_f1 - ae_f1
		dif_f2 = as_f2 - ae_f2
		dif_f3 = as_f3 - ae_f3
		dif_f4 = as_f4 - ae_f4
		onsetlocus = 700
		codalocus = 700
		voicingPoint2 = 0.08
		voicingPoint6 = 90
		onsfffp = 2500
		onsffbp = 2000
		onsburstlength = 0.031
		codafffp = 2500
		codaffbp = 2000
		codaburstlength = 0.32

	elsif cont$ == "aeef"
	#/t_t/
		f0 = ae_f0
		f1startval = ae_f1
		f2startval = ae_f2
		f3startval = ae_f3
		f4startval = ae_f4
		dif_f1 = ae_f1 - ef_f1
		dif_f2 = ae_f2 - ef_f2
		dif_f3 = ae_f3 - ef_f3
		dif_f4 = ae_f4 - ef_f4
		onsetlocus = 2500
		codalocus = 2500
		voicingPoint2 = 0.08
		voicingPoint6 = 0
		onsfffp = 3600
		onsffbp = 100
		onsburstlength = 0.032
		codafffp = 3600
		codaffbp = 100
		codaburstlength = 0.33

	elsif cont$ == "efvt"
	#/d_t/
		f0 = ef_f0
		f1startval = ef_f1
		f2startval = ef_f2
		f3startval = ef_f3
		f4startval = ef_f4
		dif_f1 = ef_f1 - vt_f1
		dif_f2 = ef_f2 - vt_f2
		dif_f3 = ef_f3 - vt_f3
		dif_f4 = ef_f4 - vt_f4
		onsetlocus = 2500
		codalocus = 2500
		voicingPoint2 = 0.04
		voicingPoint6 = 0
		onsfffp = 3600
		onsffbp = 100
		onsburstlength = 0.032
		codafffp = 3600
		codaffbp = 100
		codaburstlength = 0.33

	elsif cont$ == "aevt"
	#/k_g/
		f0 = ae_f0
		f1startval = ae_f1
		f2startval = ae_f2
		f3startval = ae_f3
		f4startval = ae_f4
		dif_f1 = ae_f1 - vt_f1
		dif_f2 = ae_f2 - vt_f2
		dif_f3 = ae_f3 - vt_f3
		dif_f4 = ae_f4 - vt_f4
		onsetlocus = 3200
		codalocus = 3200
		voicingPoint2 = 0.08
		voicingPoint6 = 90
		onsfffp = 2500
		onsffbp = 100
		onsburstlength = 0.033
		codafffp = 2500
		codaffbp = 100
		codaburstlength = 0.34
	
	elsif cont$ == "asef"
	#/t_k/
		f0 = as_f0
		f1startval = as_f1
		f2startval = as_f2
		f3startval = as_f3
		f4startval = as_f4
		dif_f1 = as_f1 - ef_f1
		dif_f2 = as_f2 - ef_f2
		dif_f3 = as_f3 - ef_f3
		dif_f4 = as_f4 - ef_f4
		onsetlocus = 2500
		codalocus = 3200
		voicingPoint2 = 0.08
		voicingPoint6 = 0
		onsfffp = 3600
		onsffbp = 100
		onsburstlength = 0.032
		codafffp = 2500
		codaffbp = 100
		codaburstlength = 0.34

endif
#SECOND LOOP: CREATE CONTINUA
for i from 1 to 7
Create KlattGrid... 'cont$'_'i' 0 0.35 6 1 1 6 1 1 1
#from 0 to 0.3s is closure

##########ONSET##########

#Formant loci
#F1
Add oral formant frequency point... 1 0.03 1
Add oral formant bandwidth point... 1 0.03 50
#F2
Add oral formant frequency point... 2 0.03 onsetlocus
Add oral formant bandwidth point... 2 0.03 50

#burst

#amplitude
Add frication amplitude point... 0.029 0
Add frication amplitude point... 0.030 40
Add frication amplitude point... onsburstlength 0

#bypass
Add frication bypass point... 0.033 25

#frication
Add frication formant frequency point... 1 0.03 onsfffp
Add frication formant amplitude point... 1 0.03 35
Add frication formant bandwidth point... 1 0.03 onsffbp

Add voicing amplitude point... 0.0 0
Add voicing amplitude point... voicingPoint2 90

##########VOWEL##########
#voicing

Add voicing amplitude point... 0.2 90
Add voicing amplitude point... 0.21 0

#pitch
Add pitch point... 0.05 f0
Add pitch point... 0.21 f0-20
Add pitch point... 0.025 f0-30

#formant values
Add oral formant frequency point... 1 0.08 f1startval+(-(dif_f1/6)*(i-1))
Add oral formant bandwidth point... 1 0.08 50
Add oral formant frequency point... 2 0.08 f2startval+(-(dif_f2/6)*(i-1))
Add oral formant bandwidth point... 2 0.08 100
Add oral formant frequency point... 1 0.21 f1startval+(-(dif_f1/6)*(i-1))
Add oral formant bandwidth point... 1 0.21 50
Add oral formant frequency point... 2 0.21 f2startval+(-(dif_f2/6)*(i-1))
Add oral formant bandwidth point... 2 0.21 100
Add oral formant frequency point... 1 0.22 1
Add oral formant bandwidth point... 1 0.22 50
Add oral formant frequency point... 2 0.22 1
Add oral formant bandwidth point... 2 0.22 100

#Add oral formant frequency point... 3 0.05 f3startval+(-(dif_f3/6)*(i-1))
#Add oral formant bandwidth point... 3 0.05 200
#Add oral formant frequency point... 4 0.05 f4startval+(-(dif_f3/6)*(i-1))
#Add oral formant bandwidth point... 4 0.05 300

##########CODA##########

#Formant loci
#F1
Add oral formant frequency point... 1 0.31 1
Add oral formant bandwidth point... 1 0.31 50
#F2
Add oral formant frequency point... 2 0.31 codalocus
Add oral formant bandwidth point... 2 0.31 50

#burst

#amplitude
Add frication amplitude point... 0.30 0
Add frication amplitude point... 0.31 40
Add frication amplitude point... codaburstlength 0

#bypass
Add frication bypass point... 0.31 25

#frication
Add frication formant frequency point... 1 0.31 codafffp
Add frication formant amplitude point... 1 0.31 35
Add frication formant bandwidth point... 1 0.31 codaffbp

#voicing
Add voicing amplitude point... 0.30 0
Add voicing amplitude point... 0.31 voicingPoint6

##########TO SOUND#########
endif
#synthesis
To Sound

#Saving sound files
Write to WAV file... 'out_directory$'/'cont$'_'i'.wav
endfor
endfor