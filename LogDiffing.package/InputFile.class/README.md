Abstract object for a file (from DB or from simple txt log) to use to generate the graphs.

Daugther classes must implement:

- extractLog, generic method extracting all the logs to an Array with the correspondig `LogLine` objects
- fullFileCreation, generic method to save said logs objects in .txt form for later (used by DirectoryCrawler)
- multipleFileCreation , same as above but for multiple files for the different phases of the process (only useful with LogFile)

Local vars:
sourceFile dirOutput allLogs versionNumber totalLines