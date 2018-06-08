M = [];
M = dlmread('eqtest.txt'); %reading in velocity data in cm, needs to be m so divide by 100
y = reshape([M]',[],1);
y = y/100;
value = 0;
for i = 1:length(y)
    x(i) = value;
    value = value + 0.01;
end

figure
hold on
plot(x,y,'ko')

eqDat = [x,y];
fileID = fopen('eqtestData.tab','w');
fprintf(fileID, 'eqDataFile\n 6185, 0.0 \n');
fprintf(fileID,'%f\n',y);
fclose(fileID);
