#Vowel continuum creator
#By Fernanda Barrientos
#Creates an /a-o/ 7-step vowel continuum using Klatt Grids.
#Duration: 0.2s

#Target directory

out_directory$ = "/test"

#Defining /a/ and /o/ formant values
f1a= 900
f2a= 1400
f1o= 600
f2o= 1000

#Main loop - Creates 7 Klatt grids with their respective sound files.

for i from 1 to 7
Create KlattGrid... kg_'i' 0 0.2 6 1 1 6 1 1 1
Add pitch point... 0.05 200
Add voicing amplitude point... 0.05 80
Add oral formant frequency point... 1 0.05 900-(((f1a-f1o)/6)*(i-1))
Add oral formant bandwidth point... 1 0.05 30
Add oral formant frequency point... 2 0.05 1400-(((f2a-f2o)/6)*(i-1))
Add oral formant bandwidth point... 2 0.05 30
To Sound
Write to WAV file... 'out_directory$'/ao_'i'.wav
endfor