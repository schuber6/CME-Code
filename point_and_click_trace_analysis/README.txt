PCTA: Point-and-click trace analysis
Intended purpose:  To facilitate manual tracking--click on structures and trace them forward and backward in time to find first/last frames and area 
Side purpose:  To check automated tracking--check that traces correspond to visually recognizable structures

Example implementations in "Example Data" folder

Inputs: Movie, movie agian (this is TIRF-SIM you can put the original movie here, if it is 2-color you can put the second channel here),
	file to load tracest from (optional-if not given it will make an empty one)

To make a tracest file from an pre-tracked movie, use NSTA2Tracest or FXYCMS2Tracest depending on format
You must then save your tracest to a file to give to pcta