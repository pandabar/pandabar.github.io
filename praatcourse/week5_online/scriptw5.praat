dir$ = "/Volumes/NONAME/praatscripting/week05/week5_online/samples/"
myann = Read Strings from raw text file: dir$ + "annotation.txt"
tokens= Create Strings as tokens: "s t \vt k", " "
wav_files = Create Strings as file list: "wavlist", dir$ + "/*.wav"
nowav_files = Get number of strings
for ifile to nowav_files
selectObject: wav_files
wavfilename$ = Get string... ifile
wav_file= Read from file: dir$ + "/" + wavfilename$
mytg=To TextGrid: "word phon vot", ""
dur= Get total duration
selectObject: myann
numWords= Get number of strings
for iword to numWords
	string$ = Get string: iword
	if iword < numWords
		selectObject: mytg
		Insert boundary: 1, (dur/numWords) *iword
	endif
	selectObject: mytg
	Set interval text: 1, iword, string$
	selectObject: myann
endfor

selectObject: mytg
plusObject: wav_file
View & Edit
pauseScript: "Adjust the boundaries. Click Continue when you’re finished."
	Extract intervals where: 1, "no", "is equal to", "stuck"
	stucktg= To TextGrid: "segment", ""
	durstuck= Get total duration
	selectObject: tokens
	numphon= Get number of strings
	for iphon to numphon
		phon$= Get string: iphon
		if iphon< numphon
		selectObject: stucktg
		Insert boundary: 1, (durstuck/numphon) * iphon
		endif
		selectObject: stucktg
		Set interval text: 1, iphon, phon$
		selectObject: tokens
	endfor
endfor



