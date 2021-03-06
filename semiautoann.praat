##By Fernanda Barrientos - University of Konstanz
##This script takes several sound files where different people read the same text out loud
##There is a .txt file with the transcript of the text, called annotation.txt
##We want to annotate each one of these sound files (semi) automatically:
##The script will feed each TextGrid with the same text.


##We open the transcript file
dir$ = "/home/fernanda/website/samples"
myann = Read Strings from raw text file: dir$ + "/annotation.txt"

#Here we open all the sound files and generate an empty TextGrid file for each

wav_files = Create Strings as file list: "wavlist", dir$ + "/*.wav"
nowav_files = Get number of strings
for ifile to nowav_files
selectObject: wav_files
wavfilename$ = Get string... ifile
wav_file= Read from file: dir$ + "/" + wavfilename$
mytg=To TextGrid: "word phon vot", ""

#Here we insert the boundaries at regular time intervals.
#We know that the number of boundaries is the total of words -1,
#hence the if statement

dur= Get total duration
selectObject: myann
numWords= Get number of strings
for iword to numWords
string$ = Get string: iword
if iword < numWords
selectObject: mytg
Insert boundary: 1, (dur/numWords) *iword
endif


#And this little bit finally inserts the words between boundaries
selectObject: mytg
Set interval text: 1, iword, string$
selectObject: myann
endfor

#Here we add a pause so you have time to move the boundaries as the script fills in the TextGrid
selectObject: mytg
plusObject: wav_file
View & Edit
pauseScript: "This is a pause in the script so you can faff with the boundaries. Click Continue when you’re finished."
minusObject: wav_file
endfor

