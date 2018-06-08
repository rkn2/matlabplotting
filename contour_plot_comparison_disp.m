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
    %zdata = datanobc(:,2);
    zdata = sqrt(datanobc(:,2).^2 + datanobc(:,3).^2+ datanobc(:,4).^2);
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
        zdata = sqrt(databc1(:,2).^2 + databc1(:,3).^2+ databc1(:,4).^2);
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
        zdata = sqrt(databc2(:,2).^2 + databc2(:,3).^2+ databc2(:,4).^2);
        zAverage = abs(mean(zdata));
        % record "x" and "y" values (w,s)
        k = k + 1;
        %table(k,2) = zAverage;
        bc2(k,:) = [w,s,zAverage];   
    
    end    
end


figure;

minValue = min(bc0(:,3));
maxValue = max(bc2(:,3));

subplot(3,1,1)
%x0 = unique(bc0(:,1));
%y0 = unique(bc0(:,2));
%[X0,Y0] = meshgrid(x0,y0);
X = [0.5, 2, 3, 4; 0.5, 2, 3, 4;0.5, 2, 3, 4;0.5, 2, 3, 4];
Y = [0.05,0.05,0.05,0.05; 0.1, 0.1,0.1,0.1; 0.2,0.2,0.2,0.2,;0,0,0,0]; 
Z0 = reshape(bc0(:,3),[4,4]);
contourf(X,Y,Z0)
title('BC0','Interpreter','latex','FontSize', 24)
%xlabel('Settlement width (m)','Interpreter','latex','FontSize', 24)
%ylabel('Settlement depth (m)','Interpreter','latex','FontSize', 24)
caxis([minValue, maxValue]);
set(gca, 'FontName','latex','FontSize', 24)

subplot(3,1,2)
%x1 = unique(bc1(:,1));
%y1 = unique(bc1(:,2));
%[X1,Y1] = meshgrid(x1,y1);
X = [0.5, 2, 3, 4; 0.5, 2, 3, 4;0.5, 2, 3, 4;0.5, 2, 3, 4];
Y = [0.05,0.05,0.05,0.05; 0.1, 0.1,0.1,0.1; 0.2,0.2,0.2,0.2,;0,0,0,0]; 
Z1 = reshape(bc1(:,3),[4,4]);
contourf(X,Y,Z1)
title('BC1','Interpreter','latex','FontSize', 24)
%xlabel('Settlement width (m)','Interpreter','latex','FontSize', 24)
%ylabel('Settlement depth (m)','Interpreter','latex','FontSize', 24)
caxis([minValue, maxValue]);
set(gca, 'FontName','latex','FontSize', 24)

subplot(3,1,3)
%x2 = unique(bc2(:,1));
%y2 = unique(bc2(:,2));
%[X2,Y2] = meshgrid(x2,y2);
X = [0.5, 2, 3, 4; 0.5, 2, 3, 4;0.5, 2, 3, 4;0.5, 2, 3, 4];
Y = [0.05,0.05,0.05,0.05; 0.1, 0.1,0.1,0.1; 0.2,0.2,0.2,0.2,;0,0,0,0]; 
Z2 = reshape(bc2(:,3),[4,4]);
contourf(X,Y,Z2)
title('BC2','Interpreter','latex','FontSize', 24)
xlabel('Settlement width (m)','Interpreter','latex','FontSize', 24)
ylabel('Settlement depth (m)','Interpreter','latex','FontSize', 24)
caxis([minValue, maxValue]);
set(gca, 'FontName','latex','FontSize', 24)

colorbar('location','Manual', 'position', [0.93 0.1 0.02 0.81]);
colormap jet;


xpos = 0;
ypos = 0;
text(xpos,ypos,'Comparison of avg. vertical displacement','Interpreter','latex','FontSize', 24)
text(xpos,ypos,'Average vertical displacement (m)','Interpreter','latex','FontSize', 24)


% xlabel('Settlement width (m)', 'Interpreter','latex','FontSize', 24)
% ylabel('Settlement depth (m)','Interpreter','latex','FontSize', 24)
% zlabel('Avg. max. principal stress (N/m2)', 'Interpreter','latex','FontSize', 24)
% legend([bc0Plot,bc1Plot,bc2Plot], {'noBC', 'BC1', 'BC2'}, 'Interpreter','latex','FontSize', 36)
% set(gcf, 'PaperPositionMode', 'auto');