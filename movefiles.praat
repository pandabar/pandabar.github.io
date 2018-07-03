# Directories
source_directory$ = "\\nask.man.ac.uk\home$\My Experiments\ExpFer"
out_directory$ = "\\nask.man.ac.uk\home$\Desktop\Stimuli"
# String list
Create Strings as file list... list 'source_directory$'\*.wav
noFiles = Get number of strings

# Main loop
for ifile to noFiles
select Strings list
filename$ = Get string... ifile
Read from file... 'source_directory$'\'filename$'
Write to WAV file... 'out_directory$'\'filename$'
endfor

