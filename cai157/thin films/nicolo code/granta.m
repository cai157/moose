% get out input file from the command line
% invoke this script with the following command:
% matlab -nodisplay -r infile=\'driver1234.xml\',fermi
% the above command sets variable infile to the name 'driver1234.xml'

%infile = 'driver1991.xml'

% open our xml input file.
lib = rpLib(infile);

% retrieve user specified data out of the input file
% convert values to correct units.
xmax = rpLibGetString(lib,'input.number(xmin).current');
[xmax] = rpUnitsConvertDbl(xmin,'K');
xmin = rpLibGetString(lib,'input.number(xmax).current');
[xmin] = rpUnitsConvertDbl(xmax,'K');

% calculations...

% prepare out output section
% label graphs
rpLibPutString(lib,'output.number(xmax).current');
%rpLibPutString(lib,'output.curve(f12).xaxis.label','Fermi-Dirac Factor',0);
%rpLibPutString(lib,'output.curve(f12).yaxis.label','Energy',0);
%rpLibPutString(lib,'output.curve(f12).yaxis.units','eV',0);

% this is a slow and inefficient method of putting
% large amounts of data back in to the rappture library object
%for j=1:200
%  rpUtilsProgress((j/200*100),'Iterating');
%  putStr = sprintf('%12g  %12g\n', f(j), E(j));
%  % put the data into the xml file
%  rpLibPutString(lib,'output.curve(f12).component.xy',putStr,1);
%end

% a better way is to take advantage of matlab's vector operations.
%outData = [f;E];
%putStr = sprintf('%12g  %12g\n', outData);
%rpLibPutString(lib,'output.curve(f12).component.xy',putStr,0);

% signal the end of processing
rpLibResult(lib);

quit;
