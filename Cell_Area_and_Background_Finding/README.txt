Code to allow for cell area calculation as well as calculation of the average cytosolic intensit of the cell

Start with ZStackThresh_Wrapper and input the folders with movies in them
This is meant to find cell area of the center frames of a 3-frame Zstack

Code will ask you to select an estimate of a intensity threshold to separate cell pixels from background pixels

Code will then display the results and ask for an input as to whether you're satisfied:

1 will use the value

2 will ask for a new value and repeat

3 will only select the largest contiguous boundary (and redisplay)

4 will exit code

Once all thresholds are chosen, second part of code will save areas, cytosolic intensities, and cell masks to a file in each folder

Once masks are saved, code can be rerun without reselecting thresholds