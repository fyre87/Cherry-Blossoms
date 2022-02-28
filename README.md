# Cherry-Blossoms
This is our github for our predictions for the Cherry Blossom competition

To run this file, download all the files and run the "Regressions.do" stata file in the "CherryBlossomData" folder.
Be sure to change the path to the path of your computer in the globals of the .do file!

The Enhanced Vegitation Index data is in the "EVI_output" folder. You can see how it is used for each place by looking at the "Regressions.do" file.
The data given to us by the competition is in the "data" file which has bloom rates along with data on growing degree days.

All of the "[PLACE]merged.dta" files in the CherryBlossomData folder contain the data with the predicted dates that should be created by the "Regressions.do" file.
If for some reason you cannot get the .do file to work, you can check those .dta files for what the output of our stata code is.
From those .dta files, we hand entered in our predictions to the .csv file which has our final predictions for when we think the Cherry Blossoms will blossom. 

Finally, all of our Vancouver previously obtained bloom date data came from this: https://forums.botanicalgarden.ubc.ca/threads/kerrisdale.36008/
