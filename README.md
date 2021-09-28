# Sensor-paper-for-CNN-based-image-colouring
Data and code for paper "CNN-based spectral super-resolution of panchromatic night-time light imagery: City-size-associated neighborhood effects" in Sensors

Please refer as

Rybnikova N.,  Mirkes E.M., Gorban A.N.,  Data and code for paper "CNN-based spectral super-resolution of panchromatic night-time light imagery: City-size-associated neighborhood effects" in Sensors, available online https://github.com/Mirkes/Sensor-paper-for-CNN-based-image-colouring

## Short description
### code.m
This repository contains Matlab code for CNN modelling data in code.m. The code performs the following steps:
1. uploads 48 city-size images;
2. slices each city-size image into an input images, required for CNN, of certain size (parameter k);
3. runs the CNN, using built-in trainNetwork function, over training and testing sets;
4. calculates the CNN performance via two indicators - Weighted Mean Squared Error (wmse) and Pearson's correlation (correl) - for each pair of cities, used as the training and the testing datasets.
### tif - files
This repository contains 48 tif-files in the tif-data subfolder. That is, for each of 8 considered cities, there are 6 city-size images: 
1. panchromatic light (file names start with 'alan'); 
2. average of HBASE (file names start with 'avgHBASE');  
3. standard deviation of HBASE (file names start with 'sdHBASE');  
4. red ligths (file names start with 'red'); 
5. green ligths (file names start with 'green'); 
6. blue ligths (file names start with 'blue').
 
All the files were pre-processed (that is, georeferenced, cropped, and resampled to the resolution of the coarsest layer - that is, panchromatic light image) and saved from ArcGIS v.10.5.

<b><i><u>Importantly</u></i></b>, the pixel attributes in tif-files show the actual values and thus generally exceed 0-1 diapason and might not be properly displayed by standard image-vieing software. png versions of tif-files are presented in png folder. tif2png.m code used to convert tif-files into conventional png images is presented in root of repository

### tif2png
This script allow you to convert presented tif-files into conventional png images

### png-data
This folder contains png vestions of tif-files and can be used for illustrations only. All processing must pe performed with tif-files.


