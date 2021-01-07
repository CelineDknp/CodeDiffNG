Object abstracting the pipeline to clean and create all files 

Constructor: 	FileProcessor with: 'Filev1.log' and: 'Filev2.log'.
					FileProcessor withDB: 'FileDB1.db3' and: 'FileDB2.db3'


Instance variables:
- fileV1: filename of first file version 
- fileV2: filename of second file version
- logFileV1: logFile object to create all V1 files
- logFileV2: logFile object to create all V2 files 


Methods:
- `setUp`: Setup methods to instanciate all instance variables and objects
- `createFullLogFiles`: Extracts all log files with the default directory name
- `createMultipleLogFiles`: Extracts all log files in multiple parts with the default directory name
- `createDotFiles`: Run trough the directory and create dot files for all said files
- `createDotFile: aFileName`: Uses `synoptic.jar`, `daikonizer.jar` and `plume.jar` to create a dot file corresponding to aFileName.
- `extractAllFull`: cleans up the files in full, then create the corresponding dot files
- `extractAllMultiple`: cleans up the files, split them in versions, then create the corresponding dot files