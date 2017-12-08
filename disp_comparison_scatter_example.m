addpath('C:\Users\Rebecca Napolitano\Documents\GitHub\matlabplotting\')
import package_BreakPlot.*

%=============================GRAB ALL FILES=============================


%get all disp_py files from nobc folder
pathbc0 = 'C:\Users\Rebecca Napolitano\Documents\datafiles\Romanbondingcourses\2017_12_6_lateral\nobc\';
%cd pathnobc;
fileHandlesBC0 = dir('C:/Users/Rebecca Napolitano/Documents/datafiles/Romanbondingcourses/2017_12_6_lateral/nobc/*_disp_py.dat');

%get all disp_py files from bc1 folder
pathbc1 = 'C:\Users\Rebecca Napolitano\Documents\datafiles\Romanbondingcourses\2017_12_6_lateral\bc1\';
%cd pathnobc;
fileHandlesBC1 = dir('C:/Users/Rebecca Napolitano/Documents/datafiles/Romanbondingcourses/2017_12_6_lateral/bc1/*_disp_py.dat');

%get all disp_py files from bc1 folder
pathbc2 = 'C:\Users\Rebecca Napolitano\Documents\datafiles\Romanbondingcourses\2017_12_6_lateral\bc2\';
%cd pathnobc;
fileHandlesBC2 = dir('C:/Users/Rebecca Napolitano/Documents/datafiles/Romanbondingcourses/2017_12_6_lateral/bc2/*_disp_py.dat');

%==============================IMPORT ======================================

%go through no bc filehandles and import the data
numberFileHandlesBC0 = length(fileHandlesBC0);
bc0 = zeros(length(fileHandlesBC0),2); %1 = force, 2 = avg disp

%go through BC1 filehandles and import the data
numberFileHandlesBC1 = length(fileHandlesBC1);
bc1 = zeros(length(fileHandlesBC1),2); %1 = force, 2 = avg disp

%go through BC2 filehandles and import the data
numberFileHandlesBC2 = length(fileHandlesBC2);
bc2 = zeros(length(fileHandlesBC2),2); %1 = force, 2 = avg disp


%==============================DATA MANIPULATION==========================

for i = 1:numberFileHandlesBC0
   
    %find out what value the force is
    fileName = fileHandlesBC0(i).name;
    numStart = strfind(fileName, '_bc') + 5;
    numEnd = strfind(fileName, '_disp') -1 ;
    force = str2double(fileName(numStart:numEnd));
    bc0(i,1) = force;
        
    if force == 0
        %find out the average displacement
        databc0 = importdata([pathbc0,fileName]);
        sizeData = size(databc0);
        lengthData = sizeData(1);    
        displacement = zeros(lengthData,1);
        for row = 1:lengthData
            displacement(row,1) = sqrt(databc0(row,2)^2 + databc0(row,3)^2 + databc0(row,4)^2);
        end
        correctionFactor = abs(mean(displacement));
        bc0(i,2) = abs(mean(displacement))-correctionFactor;
    else
        %find out the average displacement
        databc0 = importdata([pathbc0,fileName]);
        sizeData = size(databc0);
        lengthData = sizeData(1);    
        displacement = zeros(lengthData,1);
        for row = 1:lengthData
            displacement(row,1) = sqrt(databc0(row,2)^2 + databc0(row,3)^2 + databc0(row,4)^2);
        end
        bc0(i,2) = abs(mean(displacement)) - correctionFactor;        
    end
    
end

for i = 1:numberFileHandlesBC1
   
    %find out what value the force is
    fileName = fileHandlesBC1(i).name;
    numStart = strfind(fileName, '_bc') + 5;
    numEnd = strfind(fileName, '_disp') -1 ;
    force = str2double(fileName(numStart:numEnd));
    bc1(i,1) = force;

    if force == 0
        %find out the average displacement
        databc1 = importdata([pathbc1,fileName]);
        sizeData = size(databc1);
        lengthData = sizeData(1);    
        displacement = zeros(lengthData,1);
        for row = 1:lengthData
            displacement(row,1) = sqrt(databc1(row,2)^2 + databc1(row,3)^2 + databc1(row,4)^2);
        end
        correctionFactor = abs(mean(displacement));
        bc1(i,2) = abs(mean(displacement))-correctionFactor;
        
    
    else
        %find out the average displacement
        databc1 = importdata([pathbc1,fileName]);
        sizeData = size(databc1);
        lengthData = sizeData(1);    
        displacement = zeros(lengthData,1);
        for row = 1:lengthData
            displacement(row,1) = sqrt(databc1(row,2)^2 + databc1(row,3)^2 + databc1(row,4)^2);
        end
        bc1(i,2) = abs(mean(displacement)) - correctionFactor;        
    end    
    
    
    
end

for i = 1:numberFileHandlesBC2
    
    %find out what value the force is
    fileName = fileHandlesBC2(i).name;
    numStart = strfind(fileName, '_bc') + 5;
    numEnd = strfind(fileName, '_disp') -1 ;
    force = str2double(fileName(numStart:numEnd));
    bc2(i,1) = force;
    
    if force == 0
        %find out the average displacement
        databc2 = importdata([pathbc2,fileName]);
        sizeData = size(databc2);
        lengthData = sizeData(1);    
        displacement = zeros(lengthData,1);
        for row = 1:lengthData
            displacement(row,1) = sqrt(databc2(row,2)^2 + databc2(row,3)^2 + databc2(row,4)^2);
        end
        correctionFactor = abs(mean(displacement));
        bc2(i,2) = abs(mean(displacement))-correctionFactor;
    else
        %find out the average displacement
        databc2 = importdata([pathbc2,fileName]);
        sizeData = size(databc2);
        lengthData = sizeData(1);    
        displacement = zeros(lengthData,1);
        for row = 1:lengthData
            displacement(row,1) = sqrt(databc2(row,2)^2 + databc2(row,3)^2 + databc2(row,4)^2);
        end
        bc2(i,2) = abs(mean(displacement)) - correctionFactor;        
    end
   
    
end
%==============================PLOT ======================================

figure;
hold on
bc0Plot = scatter(bc0(:,1), bc0(:,2),'filled');
bc1Plot = scatter(bc1(:,1), bc1(:,2),'filled');
bc2Plot = scatter(bc2(:,1), bc2(:,2),'filled');

title('Comparison of displacement','Interpreter','latex','FontSize', 36)
xlabel('Force(N)', 'Interpreter','latex','FontSize', 24)
ylabel('Displacement (m)','Interpreter','latex','FontSize', 24)
legend([bc0Plot,bc1Plot,bc2Plot], {'noBC', 'BC1', 'BC2'},'FontSize', 24)
set(gca,'yscale','log','FontName','latex','FontSize', 36)

%BreakPlot(x,y,y_break_start,y_break_end,break_type) 
%BreakPlot(0,0,1,4, 'Line')



