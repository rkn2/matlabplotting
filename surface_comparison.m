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
bc0 = zeros(length(fileHandlesNOBC),3);
for file = 1:numberFileHandles
    fileName = fileHandlesNOBC(file).name;
    wloc = strfind(fileName,'-w')+2;
    wend = strfind(fileName(wloc:end),'-') - 2 + wloc;
    w = str2double(fileName(wloc:wend));
    sloc = strfind(fileName,'-s')+2;
    send = strfind(fileName(sloc:end),'_') - 2 + sloc;
    s = str2double(fileName(sloc:send));
    % generate a z value (single data point from data matrix)
    datanobc = importdata([pathnobc,fileName]); 
    zdata = datanobc(:,4);
    zAverage = abs(mean(zdata));
    % record "x" and "y" values (w,s)
    i = i + 1;
    %table(i,1) = zAverage;
    bc0(i,:) = [w,s,zAverage];    
end

%====================================================================================================================================

%go through bc filehandles and split them into bc1 and bc2 
numberFileHandles = length(fileHandlesBC);
numberFileHandles2 = numberFileHandles/2;

bc1 = zeros(numberFileHandles2,3);
bc2 = zeros(numberFileHandles2,3);

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
        zAverage = abs(mean(zdata));
        % record "x" and "y" values (w,s)
        j = j + 1;
        %table(j,2) = zAverage;
        bc1(j,:) = [w,s,zAverage]; 
        
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
        zAverage = abs(mean(zdata));
        % record "x" and "y" values (w,s)
        k = k + 1;
        %table(k,2) = zAverage;
        bc2(k,:) = [w,s,zAverage];   
    
    end    
end


x = bc0(:,1);
y = bc0(:,2);
z = bc0(:,3);
 
nx = length(unique(x));
ny = length(unique(y));
 
xgrid = reshape(x,[nx,ny]);
ygrid = reshape(y,[nx,ny]);
zgrid = reshape(z,[nx,ny]);
 
xsort = sortrows( transpose([xgrid(1,:);1:nx]) );
 
xgrid = xgrid(:,xsort(:,2));
ygrid = ygrid(:,xsort(:,2));
zgrid = zgrid(:,xsort(:,2));
 
 
ysort = sortrows( [ygrid(:,1),transpose(1:nx)] );
 
xgrid = xgrid(ysort(:,2),:);
ygrid = ygrid(ysort(:,2),:);
zgrid = zgrid(ysort(:,2),:);

figure;
hold on


bc0Plot = surf(xgrid,ygrid,zgrid,'FaceColor', 'b' );

x = bc1(:,1);
y = bc1(:,2);
z = bc1(:,3);
 
nx = length(unique(x));
ny = length(unique(y));
 
xgrid = reshape(x,[nx,ny]);
ygrid = reshape(y,[nx,ny]);
zgrid = reshape(z,[nx,ny]);
 
xsort = sortrows( transpose([xgrid(1,:);1:nx]) );
 
xgrid = xgrid(:,xsort(:,2));
ygrid = ygrid(:,xsort(:,2));
zgrid = zgrid(:,xsort(:,2));
 
 
ysort = sortrows( [ygrid(:,1),transpose(1:nx)] );
 
xgrid = xgrid(ysort(:,2),:);
ygrid = ygrid(ysort(:,2),:);
zgrid = zgrid(ysort(:,2),:);

bc1Plot = surf(xgrid,ygrid,zgrid,'FaceColor', 'g');

x = bc2(:,1);
y = bc2(:,2);
z = bc2(:,3);
 
nx = length(unique(x));
ny = length(unique(y));
 
xgrid = reshape(x,[nx,ny]);
ygrid = reshape(y,[nx,ny]);
zgrid = reshape(z,[nx,ny]);
 
xsort = sortrows( transpose([xgrid(1,:);1:nx]) );
 
xgrid = xgrid(:,xsort(:,2));
ygrid = ygrid(:,xsort(:,2));
zgrid = zgrid(:,xsort(:,2));
 
 
ysort = sortrows( [ygrid(:,1),transpose(1:nx)] );
 
xgrid = xgrid(ysort(:,2),:);
ygrid = ygrid(ysort(:,2),:);
zgrid = zgrid(ysort(:,2),:);

bc2Plot = surf(xgrid,ygrid,zgrid,'FaceColor', 'm');

%nobc = surf(all_data_noBC(:,1),all_data_noBC(:,2),all_data_noBC(:,3), 'FaceColor', 'b', 'FaceAlpha', 0.5, 'EdgeColor', 'none');
title('Bc vs nobc')
xlabel('width')
ylabel('depth')
zlabel('disp')
legend([bc0Plot,bc1Plot,bc2Plot], {'noBC', 'BC1', 'BC2'})
set(gca, 'zscale', 'log','FontName','latex')