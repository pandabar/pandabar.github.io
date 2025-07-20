---
layout: post
title:  "Hello, {name}, your grade was {grade}"
date:   2025-07-20
categories: Python, teaching, programming
---

During term time, it's all fun and games until you need to communicate your students their final grade before uploading it to the system. I don't know if I'm taking it too seriously, but unless we're talking about a course with more than 20 students, I like to give them several assessments throughout the semester instead of a one-or-nothing final exam. Of course, more work for me (yay?), but some tasks can be automatized. I will talk about a script that automatizes the grading of IPA transcriptions later, but for now, I have a script for the email problem.

[My script](https://github.com/pandabar/python_misc) needs a .csv file with your students' names and grades. I had three small assignments (whose average is worth 20% of their final grade), a midterm (30%), and a final exam (50%). You will also need to create an empty folder for the output.

The script also performs some calculations, i.e. the average for the assignments and the final grades. And this was quite annoying, as the German grading scale goes from 1 to 5 (where 1 is the best grade) and there's no such a thing as e.g. a 1,4: You can only have a 1,0, a 1,3, a 1,7, a 2,0, and so on. The script takes care of this by pushing a potential 1,4 into a 1,3, etc. The cutoffs are set at .15, .5, and .85 (but I moved it to .88 because I can't be that evil).

The script spits out a bunch of .txt files with your students' first names as filenames, and their grades neatly listed. Since I have trust issues I didn't want to make this so automatized as to directly sending the emails without me obsessively checking them before hitting send (and also because I couldn't be bothered this time).

Happy emailing!