%{
------------------------------------------------------------------
script to write histograms and find values to use for comparing 
the different cases
------------------------------------------------------------------
%}

%===========================================================================
%get all disp_py files from nobc folder
pathnobc = 'C:/Users/Rebecca Napolitano/Documents/datafiles/Romanbondingcourses/2017_11_15_lowfric_persistent/nobc/';
cd pathnobc;
fileHandles = dir('*_disp_py.dat');
%get all disp_py files from bc folder
%pathbc = 
%split them into bc1 and bc2 using strfind and an if/else statement

%go through filehandles and import the data
numberFileHandles = length(fileHandles);
i = 0;
all_data = zeros(length(fileHandles),3);
for file = 1:numberFileHandles
    fileName = fileHandles(file).name;
    data = importdata(fileName);
    wloc = strfind(fileName,'-w')+2;
    wend = strfind(fileName(wloc:end),'-') - 2 + wloc;
    w = str2double(fileName(wloc:wend));
    sloc = strfind(fileName,'-s')+2;
    send = strfind(fileName(sloc:end),'_') - 2 + sloc;
    s = str2double(fileName(sloc:send));
    % generate a z value (single data point from data matrix)
    zdata = data(4,:);
    zAverage = mean(zdata);
    % record "x" and "y" values (w,s)
    i = i + 1;
    all_data(i,:) = [w,s,zAverage];
end

