dir$ = "/media/fernenri/NONAME/praatscripting/week05/week5_online/samples/"
myann = Read Strings from raw text file: dir$ + "annotation.txt"
tokens = Create Strings as tokens: "s t \vt k", " ,"
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
Extract intervals where: 1, "no", "is equal to", "stuck"
tg2= To TextGrid: "phone", ""
dur2= Get total duration
selectObject: tokens
nofphones= Get number of strings
for iphone to nofphones
    phone$ = Get string: iphone
    if iphone < nofphones
    selectObject: tg2
    Insert boundary: 1, (dur2/nofphones) *iphone
    endif
selectObject: mytg
Set interval text: 1, iphone, phone$
selectObject: tokens
#View & Edit
#pauseScript: "This is a pause in the script so you can adjust the boundaries. Click Continue when you’re finished."
#minusObject: wav_file
endfor
endfor
