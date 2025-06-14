# Answers, week 12

## Part 1: Calling the procedure

We make a list of instances, each one corresponding to a tone. We add four values: the start point, the mid point, the end point, and the name of the tone in question. The procedure will be called **addTone**.

```
@addTone: 230, 230, 230, "ma1"
@addTone: 190, 210, 230, "ma2"
@addTone: 170, 150, 210, "ma3"
@addTone: 230, 190, 150, "ma4"
```
## Part 2: The procedure

Now we prepare the procedure. The first line defines it: we give it the name **addTone**. Then we name the variables, so that the first value in each one of the instances above corresponds to **.start**, the second one to **.mid**, etc.

```
procedure addTone: .start, .mid, .end, .tone$
```
The following lines are very similar to those seen in Week 9: we select the Sound object and create a Manipulation object. Then we create an empty PitchTier object, which we then fill in with the values stated in the procedure.

```
selectObject: "Sound ma"
man=To Manipulation: 0.1, 75, 600
Create PitchTier: ".$tone", 0, 0.5
Add point: 0, .start
Add point: 0.25, .mid
Add point: 0.5, .end
```
After that, we replace the PitchTier. Then we do the resynthesis, which will create a Sound object with the new pitch contour.

```
plusObject: man
Replace pitch tier
selectObject: man
Get resynthesis (overlap-add)
Rename: .tone$
endproc
```
