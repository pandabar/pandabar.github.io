# Directories
sound_directory$ = "/Users/mfbxkfb2/Desktop/master"
out_directory$ = "/Users/mfbxkfb2/Desktop/master/scaled"

# String list
Create Strings as file list... list 'sound_directory$'/*.wav
noFiles = Get number of strings

for ifile to noFiles
select Strings list
filename$ = Get string... ifile

Read from file... 'sound_directory$'/'filename$'

Scale intensity: 70

Write to WAV file... 'out_directory$'/'filename$'_scaled.wav

endfor
select all
Remove
echo all files have been scaled.