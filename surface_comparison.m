%{
------------------------------------------------------------------
script to write histograms and find values to use for comparing 
the different cases
------------------------------------------------------------------
%}

%===========================================================================

%get all disp_py files from nobc folder
pathnobc = 'C:\Users\Rebecca Napolitano\Documents\datafiles\Romanbondingcourses\2017_11_15_lowfric_persistent\nobc\';
%cd pathnobc;
fileHandlesNOBC = dir('C:/Users/Rebecca Napolitano/Documents/datafiles/Romanbondingcourses/2017_11_15_lowfric_persistent/nobc/*_disp_py.dat');
%get all disp_py files from bc folder
pathbc = 'C:\Users\Rebecca Napolitano\Documents\datafiles\Romanbondingcourses\2017_11_15_lowfric_persistent\bc\';
%cd pathnobc;
fileHandlesBC = dir('C:/Users/Rebecca Napolitano/Documents/datafiles/Romanbondingcourses/2017_11_15_lowfric_persistent/bc/*_disp_py.dat');

%tableLength = length(fileHandlesNOBC) + length(fileHandlesBC);
%table = zeros(tableLength, 3);

%go through no bc filehandles and import the data
numberFileHandles = length(fileHandlesNOBC);
i = 0;
all_data_noBC = zeros(length(fileHandlesNOBC),3);
for file = 1:numberFileHandles
    fileName = fileHandlesNOBC(file).name;
    datanobc = importdata([pathnobc,fileName]); % THIS IS WHERE IT DOES NOT WORK. CD DOES NOT WORK AND NEITHER DOES THIS..
    wloc = strfind(fileName,'-w')+2;
    wend = strfind(fileName(wloc:end),'-') - 2 + wloc;
    w = str2double(fileName(wloc:wend));
    sloc = strfind(fileName,'-s')+2;
    send = strfind(fileName(sloc:end),'_') - 2 + sloc;
    s = str2double(fileName(sloc:send));
    % generate a z value (single data point from data matrix)
    zdata = datanobc(:,4);
    zAverage = mean(zdata);
    % record "x" and "y" values (w,s)
    i = i + 1;
    %table(i,1) = zAverage;
    all_data_noBC(i,:) = [w,s,zAverage];    
end

%====================================================================================================================================

%go through bc filehandles and split them into bc1 and bc2 
numberFileHandles = length(fileHandlesBC);
numberFileHandles2 = numberFileHandles/2;

all_data_BC1 = zeros(numberFileHandles2,3);
all_data_BC2 = zeros(numberFileHandles2,3);

j = 0;
k = 0;

for file = 1:numberFileHandles
    fileName = fileHandlesBC(file).name;
    rloc = strfind(fileName, '_r')+ 2;
    rend = strfind(fileName(rloc:end),'-w')-2 + rloc;
    r = str2double(fileName(rloc:rend));
    disp(r)

    if r == 1
        disp('got 1')
        wloc = strfind(fileName,'-w')+2;
        wend = strfind(fileName(wloc:end),'-') - 2 + wloc;
        w = str2double(fileName(wloc:wend));
        sloc = strfind(fileName,'-s')+2;
        send = strfind(fileName(sloc:end),'_') - 2 + sloc;
        s = str2double(fileName(sloc:send));
        databc1 = importdata([pathbc,fileName]); 
        zdata = databc1(:,4);
        zAverage = mean(zdata);
        % record "x" and "y" values (w,s)
        j = j + 1;
        %table(j,2) = zAverage;
        all_data_BC1(j,:) = [w,s,zAverage]; 
        
    else 
        disp('got 2!')
        wloc = strfind(fileName,'-w')+2;
        wend = strfind(fileName(wloc:end),'-') - 2 + wloc;
        w = str2double(fileName(wloc:wend));
        sloc = strfind(fileName,'-s')+2;
        send = strfind(fileName(sloc:end),'_') - 2 + sloc;
        s = str2double(fileName(sloc:send));
        databc2 = importdata([pathbc,fileName]); 
        zdata = databc2(:,4);
        zAverage = mean(zdata);
        % record "x" and "y" values (w,s)
        k = k + 1;
        %table(k,2) = zAverage;
        all_data_BC2(k,:) = [w,s,zAverage];   
    
    end    
end

figure;
hold on
%nobcdata = [0.5,0.5,0.5,2,2,2,3,3,3,4,4,4;0.05,0.1,0.2,0.05,0.1,0.2,0.05,0.1,0.2,0.05,0.1,0.2;rand,rand,rand,rand,rand,rand,rand,rand,rand,rand,rand,rand];
%bc1data = [0.5,0.5,0.5,2,2,2,3,3,3,4,4,4;0.05,0.1,0.2,0.05,0.1,0.2,0.05,0.1,0.2,0.05,0.1,0.2;rand,rand,rand,rand,rand,rand,rand,rand,rand,rand,rand,rand];
%bc2data = [0.5,0.5,0.5,2,2,2,3,3,3,4,4,4;0.05,0.1,0.2,0.05,0.1,0.2,0.05,0.1,0.2,0.05,0.1,0.2;rand,rand,rand,rand,rand,rand,rand,rand,rand,rand,rand,rand];
surf(all_data_noBC, 'FaceColor', 'b', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
disp('firstplotted')
surf(all_data_BC1, 'FaceColor', 'g', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
surf(all_data_BC2, 'FaceColor', 'm', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
title('Bc vs nobc')
xlabel('width')
ylabel('depth')
zlabel('disp')
