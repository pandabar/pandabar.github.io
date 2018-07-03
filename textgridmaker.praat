#Textgrid creator
#By Fernanda Barrientos (University of Manchester)

#directories

input_directory$ = "/Users/mfbxkfb2/Desktop/tododenuevo/wordswithenlargedv/textgrids"
out_directory$ = "/Users/mfbxkfb2/Desktop/tododenuevo/refiltered"

#Reading files

strings = Create Strings as file list: "list", input_directory$ + "/*.TextGrid"
numberOfFiles = Get number of strings


for ifile to numberOfFiles
	selectObject: strings
	filename$ = Get string... ifile
	textgridfile = Read from file: input_directory$ + "/" + filename$
	nonumber$ = filename$ - right$ (filename$, 16)

#This if loop will replicate different textgrids per file. It will also create textgrids with different names.
	
if filename$ == "book1_scaled.TextGrid" 
	for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_as_'i'.TextGrid
	endfor
	for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_ic_'i'.TextGrid
	endfor
	for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_o_'i'.TextGrid
	endfor
	for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_u_'i'.TextGrid
	endfor

elsif filename$ =="cut1_scaled.TextGrid"
	for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_a_'i'.TextGrid
	endfor
for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_o_'i'.TextGrid
	endfor
for i from 1 to 7
		Copy... nonumber$
		Save as text file... 'out_directory$'/'nonumber$'_hs_'i'.TextGrid
	endfor
elsif filename$ == "pit1_scaled.TextGrid"
for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_i_'i'.TextGrid
	endfor
for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_e_'i'.TextGrid
	endfor
for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_vt_'i'.TextGrid
	endfor
for i from 1 to 7
		Copy... 'nonumber$'
		Save as text file... 'out_directory$'/'nonumber$'_as_'i'.TextGrid
	endfor

elsif filename$ = "pot1_scaled.TextGrid"
for i from 1 to 7
		Copy... nonumber$
		Save as text file... 'out_directory$'/'nonumber$'_a_'i'.TextGrid
	endfor
for i from 1 to 7
		Copy... nonumber$
		Save as text file... 'out_directory$'/'nonumber$'_o_'i'.TextGrid
	endfor
for i from 1 to 7
		Copy... nonumber$
		Save as text file... 'out_directory$'/'nonumber$'_vt_'i'.TextGrid
	endfor
endif
endfor
