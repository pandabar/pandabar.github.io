# Directories: the sound directory has only the vowels.
# Out directory= where concatenated vowels go.
sound_directory$ = "continuum/"
out_directory$ = "concatenated/"
	
# String list
Create Strings as file list... list 'sound_directory$'/*.wav
noFiles = Get number of strings
	
# Main loop
for ifile from 1 to noFiles
	select Strings list
	filename$ = Get string... ifile
	token$= replace$(filename$, ".wav", "", 0)
	step$= right$(token$, 1)
	first= number(step$)
	following= first +1
	if first >=1
	appendInfoLine: "Opening token ", first,"..."
	Read from file... 'sound_directory$'token'first'.wav
	appendInfoLine: "Creating 1 s ISI..."
	Create Sound from formula... silence 1 0 1 11000 0
	appendInfoLine: "Opening token ", following,"..."
	Read from file... 'sound_directory$'token'following'.wav
	#Concatenating sound A + silence + sound B
		select all
		minus Strings list
		Concatenate
	appendInfoLine: "Concatenating token ", first, " and token ", following,"..."
	# Write
		Save as WAV file... 'out_directory$'token'first'_token'following'.wav
		appendInfoLine: "Saving token", first, "_token", following,".wav..."
		# Remove before next iteration of for loop
		select all
		minus Strings list
		Remove
	endif
endfor

appendInfoLine: "all files concatenated!"
#open files to check:
# String list
Create Strings as file list... list2 'out_directory$'/*.wav
noFiles2 = Get number of strings
	
# Main loop
for ifile from 1 to noFiles2
	select Strings list2
	filename2$ = Get string... ifile
Read from file... 'out_directory$''filename2$'
endfor