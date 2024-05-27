# fluorescenceActionPotential

This Matlab app alows the user to extract action potential signals triggered 
as a response of cells to pulsed electric field exposure. Application was 
developed in the scope of the publication “Genetically engineered HEK cells 
as a valuable tool for studying electroporation in excitable cells,” [1].

Installation and running:
To use the app you can run it in Matlab, package it in Matlab or download 
the installer package from GitHub.

Use:
1.	Export the time-lapse recordings to tiff format.
 
2.	Place time-lapse recordings of all the applied voltages during an individual 
experiment into a single folder. Rename the time-lapse recordings in such a 
form that electric field E can be recognized by the Matlab app: 
<value of E>Vcm (e.g., 126Vcm for 126 V/cm). 
The remaining parts of the name can be arbitrary. For the acquisition at the 
beginning of experiment where no pulse is applied, the name end with 
000Vcm. 
An example of our time-lapse recording names: 2
022_1_20 1DOX 000Vcm, 2022_1_20 1DOX 126Vcm, 2022_1_20 1DOX 150Vcm, etc.

3.	Open the Matlab application, which can be downloaded from (LINK). 
With the button “Select data” we choose the folder containing time-lapse 
recordings of one experiment.

4.	Determine with two sliders the low threshold to get clear image of the 
membranes (in purple) and the high threshold to eliminate debris from the 
analysis (in green).

5.	Select “Analyze data”. In the second tab “Analysis”, a table with 
extracted parameters appears. On the right side of the table, figures of 
relative fluorescence in time appear for each E used. Figures for a given 
E can be selected from the drop-down menu on the left side, above the table. 

6.	All the figures can be examined and in the case of false peak detection, 
manual correction of peaks can be performed: by selecting “Clear AUTO peaks”, 
the peaks that were detected automatically are cleared and by clicking on the 
figure we can manually determine a new peak timepoint. By selecting “Rerun 
AUTO peak detection”, the automatic peak detection is rerun. In all these 
cases, the extracted parameters are adjusted to the new peak.

7.	By selecting “Export data”, the data are exported to the same folder in 
the form of .mat file, Excel file and PNG images of figures for each E used. 




[1] T. Batista Napotnik, B. Kos, T. Jarm, D. Miklavčič, R. P. O’Connor, and L. Rems, 
“Genetically engineered HEK cells as a valuable tool for studying electroporation 
in excitable cells,” Sci Rep, vol. 14, no. 1, p. 720, Jan. 2024, 
doi: 10.1038/s41598-023-51073-5.
