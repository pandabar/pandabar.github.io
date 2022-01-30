#Create a series of KlattGrids

;f1= 300
;f2_front=2800
;f2_back=1000


@createCont: 300, "high", 2800, 1100
@createCont: 800, "low", 1800, 1200

procedure createCont: .f1, .height$, .f2_front, .f2_back
for i from 1 to 5
    Create KlattGrid: .height$+string$(i), 0, 0.5, 6, 1, 1, 6, 1, 1, 1
    Add pitch point: 0.05, 180
    Add pitch point: 0.45, 170
    Add voicing amplitude point: 0.25, 90
    Add oral formant frequency point: 1, 0.25, .f1
    Add oral formant bandwidth point: 1, 0.25, 50
    Add oral formant frequency point: 2, 0.25, .f2_front -(((.f2_front - .f2_back)/4)*i-1)
    Add oral formant bandwidth point: 2, 0.25, 50
    To Sound
    Save as WAV file: "/home/fernanda/Desktop/continua/" + .height$+string$(i)+".wav"
    endfor
endproc
