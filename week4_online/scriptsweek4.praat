selectObject: "Sound tigermouse3"
plusObject: "TextGrid tigermouse3"
appendInfoLine: "word", tab$, "sound", tab$, "start", tab$, "end", tab$,"VOT"
Extract intervals where: 1, "yes", "starts with", "VOT"
n = numberOfSelected ("Sound")
for i to n
    sound [i] = selected ("Sound", i)
endfor
for i to n
        selectObject: sound [i]
        start= Get start time
        end= Get end time
        vot = Get total duration
        selectObject: "TextGrid tigermouse3"
        word= Get interval at time: 3, start
        word$ = Get label of interval: 3, word
        sound$= Get label of interval: 2, word
appendInfoLine: i, tab$, word$, tab$, sound$, tab$, start, tab$, end, tab$, vot
selectObject: sound [i]
endfor


####

