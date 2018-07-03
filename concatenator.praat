#Concatenator#
#By Fernanda Barrientos - University of Manchester#
#Description: concatenates CVC noncewords + silence + target vowel, according to vowel files#

# Directories: the sound directory has only the vowels. Onsets and codas are specificed for each vowel as individual paths.
sound_directory$ = "/Volumes/KINGSTON/pretties/vowels"
out_directory$ = "/Users/mfbxkfb2/Desktop/zero"

# String list
Create Strings as file list... list 'sound_directory$'/*.wav
noFiles = Get number of strings

# Main loop
for ifile to noFiles
select Strings list
filename$ = Get string... ifile

vowel$ = left$ (filename$, 7)

#if loop: defines which onsets and codas go with which vowels.
#if vowel$ == "ae_a"
	# Onset
	#Read from file... /Users/mfbxkfb2/Desktop/definitivo2/onsets/ok/scaled/t_11000.wav_scaled.wav
	# Vowel
	#Read from file... 'sound_directory$'/'filename$'
	# Coda
	#Read from file... /Users/mfbxkfb2/Desktop/definitivo2/codas/ok/t_11000.wav_scaled.wav
#if vowel$ == "ae_e"
	# Onset
	#Read from file... /Users/mfbxkfb2/Desktop/definitivo2/onsets/ok/k_11000.wav_scaled.wav
	# Vowel
	#Read from file... 'sound_directory$'/'filename$'
	# Coda
	#Read from file... /Users/mfbxkfb2/Desktop/definitivo2/codas/ok/k_11000.wav_scaled.wav

if vowel$ == "pot1_a_"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/book1_b_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/cup2_p_1.wav

elsif vowel$ == "pot1_o_"
# Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/book1_b_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/cup2_p_1.wav

elsif vowel$ == "pit1_i_"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/peak2_p_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/cup2_p_1.wav

elsif vowel$ == "pit1_e_"
 #Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/peak2_p_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/cup2_p_1.wav

elsif vowel$ == "book1_o"
 #Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/pot1_p_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/peak2_k_1.wav

elsif vowel$ == "book1_u"
# Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/pot1_p_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/peak2_k_1.wav

elsif vowel$ == "cut1_a_"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/pot1_p_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/beat2_t_1.wav

elsif vowel$ == "cut1_o_"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/pot1_p_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/peak2_k_1.wav

elsif vowel$ == "pot1_vt"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/book1_b_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/cup2_p_1.wav

elsif vowel$ == "book1_i"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/pot1_p_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/cup2_p_1.wav

elsif vowel$ == "book1_a"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/book1_b_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/beat2_t_1.wav

elsif vowel$ == "pit1_as"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/beat2_b_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/peak2_k_1.wav

elsif vowel$ == "pit1_vt"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/beat2_b_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/peak2_k_1.wav

elsif vowel$ == "cut1_hs"
#Onset
	Read from file... /Volumes/KINGSTON/pretties/onsets/beat2_b_1.wav
# Vowel
	Read from file... 'sound_directory$'/'filename$'
# Coda
	Read from file... /Volumes/KINGSTON/pretties/codas/cup2_p_1.wav

endif


# Creates Silence
#Create Sound from formula... silence 1 0 1 11000 0

# Choosing target vowel
#vowel$ = left$ (filename$, 4)
#if vowel$ == "ae_a"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/ae_a_1.wav
#elsif vowel$ == "ae_e"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/ae_e_1.wav
#elsif vowel$ == "as_a"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/as_a_1.wav
#elsif vowel$ == "as_o"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/as_o_1.wav
#elsif vowel$ == "ic_i"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/ic_i_1.wav
#elsif vowel$ == "ic_e"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/ic_e_1.wav
#elsif vowel$ == "hs_o"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/hs_o_1.wav
#elsif vowel$ == "hs_u"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/hs_u_1.wav
#elsif vowel$ == "vt_a"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/vt_a_1.wav
#elsif vowel$ == "vt_o"
#Read from file... /Users/mfbxkfb2/Desktop/continua3/desilenced/vt_o_1.wav
#endif

# Concatenate everything
select all
minus Strings list
Concatenate

# Write
Write to WAV file... 'out_directory$'/'vowel$''ifile'.wav

# Remove before next iteration of for loop
select all
minus Strings list
Remove

endfor

# Tidy up
select all
Remove
echo all CVC files concatenated.
