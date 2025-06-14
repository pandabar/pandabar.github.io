---
layout: post
title:  "Vowel synthesis with Praat via Table objects"
date:   2025-06-02
categories: Praat, programming
---

I wanted to create a grid covering the entire acoustic space for a voice with an f0 of about 220 Hz. The annoying option consisted of creating 7-8 continua in the script with a formula, but it turns out that there is a super easy way to create a ton of vowel sounds with [Praat](https://www.fon.hum.uva.nl/praat/) that doesn't involve hard-coding of variables within the Praat script (this is already quite awesome, but it can be even better). 

![The task: create the following stimuli.](/assets/images/bark.png)

After recording myself (the 220 Hz are from my voice) I could determine the F1 and F2 values for the cardinal vowels of my hypothetical speaker. Then a fairly simple R script that makes use of the expand.grid() function created the entire grid in Bark steps (I worked this out in a bit of an awkward way by converting the cardinal vowels to Bark, then creating the grid, and then converting everything to Hz). After interpolating F3 and F4 values in a somewhat sketchy way, the .txt file with the dataframe can be read by Praat as a Table object, which can be fed to the script with the KlattGrid. 

The script selects the Table (which needs to have F1 and F2 Hz values and bandwidths) and then loops through every row to get F1, F2, and bandwidths before creating the KlattGrid, and that's pretty much it.

The results were quite satisfying. I don't know exactly what tributed to the success, but here is a couple of new things that I tried this time:

- Add a synthesised /b/ in the KlattGrid script before the vowel (yas, ecological validity and all that).
- Add a convincing pitch contour.
- Derived the correct bandwidths for each formant (this will require an entire post).

You can find the script [here](https://github.com/pandabar/praat/blob/master/vowelSynthWithTable.praat).