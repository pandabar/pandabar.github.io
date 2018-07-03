# Directories
sound_directory$ = "F2_7/individual_f2_7"
out_directory$ = "F2_7"

echo Reading files...

# String list
Create Strings as file list... list 'sound_directory$'/*.wav
noFiles = Get number of strings

# Main loop
for ifile to noFiles
select Strings list

filename$ = Get string... ifile
Read from file... 'sound_directory$'/'filename$'
name$ = replace_regex$ (filename$, ".wav", "", 0)

# Silence
Create Sound from formula... silence 1 0 0.7 44100 0

# Second stimulus
stimend$ = right$ (name$, 2)


if stimend$ == "_1"
next$ = replace$ (name$, stimend$, "_2", 0)
Read from file... 'sound_directory$'/'next$'.wav

elsif stimend$== "_2"
next$ = replace$ (name$, stimend$, "_3", 0)
Read from file... 'sound_directory$'/'next$'.wav
elsif stimend$== "_3"
next$ = replace$ (name$, stimend$, "_4", 0)
Read from file... 'sound_directory$'/'next$'.wav
elsif stimend$== "_4"
next$ = replace$ (name$, stimend$, "_5", 0)
Read from file... 'sound_directory$'/'next$'.wav
elsif stimend$== "_5"
next$ = replace$ (name$, stimend$, "_6", 0)
Read from file... 'sound_directory$'/'next$'.wav
elsif stimend$== "_6"
next$ = replace$ (name$, stimend$, "_7", 0)
Read from file... 'sound_directory$'/'next$'.wav



endif
endif

# Concatenate everything
select all
minus Strings list
Concatenate

printline Concatenating files 'filename$' and 'next$'...
# Write
Write to WAV file... 'out_directory$'/f2'name$'_f2'next$'.wav

# Remove before next iteration of for loop
select all
minus Strings list
Remove

endfor

printline Done! Your files are in your output folder. How did I do?