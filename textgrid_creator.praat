#Here we have multiple sound files and we need TextGrids for each one of them.
#We assume that every sound file is a 5-phone word.

Here we define the directory
sound_directory$ = "/home/fernanda/afolderwithwords"

# This will create a list with the names of the files in your folder:
Create Strings as file list: "list", sound_directory$+ "/*.wav"
noFiles = Get number of strings

# This creates a table called "data", with 0 rows (Praat appends them later)
# and two columns.
# One column has the file name, and the other one has the total duration
table_ID = Create Table with column names... data 0 File Duration

# And this bit opens the files with the names on the list that we created:
for ifile to noFiles
select Strings list
filename$ = Get string... ifile

sound= Read from file: sound_directory$ + "/" + filename$

# This fills in the table with rows with file names and the total file duration
end = Get total duration
select table_ID
Append row
Set string value... ifile File ’filename$’
Set numeric value... ifile Duration end

# This creates a TextGrid with 1 tier and 4 boundaries for each Sound object.
# Each boundary will be 0.1 s apart from each other (we can adjust them later).
selectObject: sound
To TextGrid: "phone", ""
Insert boundary: 1, 0.1
Insert boundary: 1, 0.2
Insert boundary: 1, 0.3
Insert boundary: 1, 0.4
endfor

##This bit selects all your TextGrid files after you annotated them.
# This script saves all your newly annotated TextGrids in your folder.

select all
tgs# = selected# ("TextGrid")
for i to size (tgs#)
selectObject: tgs# [i]
tg$ = selected$("TextGrid")
Save as text file: sound_directory$ + "/" + tg$ + ".TextGrid"
endfor


