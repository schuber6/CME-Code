Code designed to take 2-color movies, track spots in one of the colors and then calculate intensities of the spots in both colors
Make sure cme_analysis folder is in the path when you run this

Inputs: folders to analyze, frame gap of movies
folders should have some number of movies that end in "_Red.tif" and the same number (with the same names) that end in "_Green.tif".
The Red ones will be the "master" channel--these are tracked with cmeAnalysis, The corresponding Green ones will then be the "slave" channels

Output traces are in a FXYCMS cell array:
Each trace is a cell of the array
Each cell is a 2d array--the first dimension is an index for each timepoints, the second dimension has different data in each column:
column 1: frame number of that timepoint
2: x position
3: y position
4: trace category (1=verified beginning but no end, 2=verified end but no beginning, 3=beginning and end, 4=neither beginning nor end, 5=beginning, but hits end of the movie, 6=end, but hits beginning of movie, 7=hits beginning or end of the movie, but not a 5 or 6)
5:Gaussian fit intensity of master channel (red channel)
6:pixel-sum intensity of the master channel
7:pixel-sum intensity of the slave channel

Code will be run with MATLAB's batch processing, so that the MATLAB console can still be used
