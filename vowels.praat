##Vowel Formant and Duration measurement##
##By Fernanda Barrientos - University of Manchester##
##This script takes a .WAV file and .Textgrid file from a folder.
##TextGrid must be previously annotated - it only needs the vowels to be marked and have a non-zero string value.


##Opening files

	wav_file = Read from file... Deepthisvowels/test.wav
	tg_file = Read from file... Deepthisvowels/test.TextGrid

##Creating table 
	
	table_ID = Create Table with column names... data 0 file Duration F1 F2

##Extracting the vowels

select tg_file
plus wav_file
Extract non-empty intervals... 2 no

##Takes each one of the vowels and gives them a number

n= numberOfSelected("Sound")

for i to n
	sound[i] = selected ("Sound", i)
endfor

#Create TextGrid and measure crap

for i to n 
	select sound[i]
	tg[i]= To TextGrid... vowel 
	end= Get total duration
	mid= end/2
	select sound[i]
		To Formant (burg)... 0.001 5 5500 0.015 50
	f1=Get value at time... 1 mid Hertz Linear
	f2=Get value at time... 2 mid Hertz Linear

##Taking all the measurements and filling out the table

	select table_ID
	Append row
	Set string value... i file sound'i'
	Set numeric value... i Duration end
	Set numeric value... i F1 f1
	Set numeric value... i F2 f2

##Saving vsound and TextGrid files

	select sound[i]
	sound$= selected$("Sound")
	Save as WAV file... Deepthisvowels/'i'_'sound$'.wav
	select tg[i]
	tg$=selected$("TextGrid")
	Save as text file... Deepthisvowels/'i'_'tg$'.TextGrid
endfor
##Saving table

select table_ID
Save as comma-separated file... Deepthisvowels/voweldata.csv

##Clean up
select all
Remove
