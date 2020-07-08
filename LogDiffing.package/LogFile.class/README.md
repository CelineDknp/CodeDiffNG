Object representing a log file. Will read the file and simplify/extract the important informations from the logs.

Constructor: LogFile with: "aLogFile.txt"
Local vars: 
- sourceFile (String), 
- totalLine (when `extractLog` was run, total lines in original file)
- interestLines (when `extractLog` was run, total extraced lines)
- allPart (when `multipleFileCreation` was run, contains a dict with all parts and their lines)

Methods:
- `fileContent`: returns the String content of full `sourceFile` file
- `extractLog`: Loops through all lines of file `sourceFile`, creating an array with all log objects corresponding and returns the array
- `fullFileCreation`: Gets all log objects by running `extractLog` and creates a file (`sourceFile`cleaned.txt) with each line as the printOn value of the object
- `multipleFileCreation`: Gets all log objects by running `extractLog`, then iterate trough them, separating the major versions (rea, reb,...). Puts them in the `allPart` dictionary, then creates files corresponding to those parts.
- `isRelevantLog``: returns true/false by doing matching on log str to filter out the unwanted logs (bug, warning, etc)