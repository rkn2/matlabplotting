clear all
clc
figure;
hold on;
N = {'c',0.10682,0.016,0.106808,0.016;
    '\rho_{m}',0.107674,0.016,0.104831,0.016
    };

numParams = size(N);
numParams = numParams(1);
names = {};

i = 1;
while i <= numParams
    names{i} = cell2mat(N(i,1));
    higherX(i) = i;
    higherY(i) = cell2mat(N(i,2));
    higherE(i) = cell2mat(N(i,3));
    lowerX(i) = i;
    lowerY(i) = cell2mat(N(i,4));
    lowerE(i) = cell2mat(N(i,5));   
    i = i + 1;
end

higherPlot = plot(higherX,higherY,'bs','MarkerSize',10,'MarkerFaceColor','b');
lowerPlot = plot(lowerX,lowerY,'g*','MarkerSize',10,'MarkerFaceColor','g');


errorbar(higherX,higherY,higherE,'bo', 'MarkerSize',0.001,'LineWidth',1.5)
errorbar(lowerX,lowerY,lowerE,'go', 'MarkerSize',0.001,'LineWidth',1.5)

title('Distance to existing conditions','Interpreter','latex','FontSize', 36)

legend([higherPlot,lowerPlot], {'10% higher','10% lower'},'Interpreter','latex','FontSize', 24)
set(gca,'FontName','latex','FontSize', 24,'LineWidth',2,'XMinorTick','on',...
    'YMinorTick','on', 'TickLength', [.025 .0125],'Box', 'on','XTick',(1:1:4),'xticklabel',names)
xlim([0 3])
xlabel('Parameter', 'Interpreter','latex','FontSize', 24)
ylabel('Geometric distance (m)','Interpreter','latex','FontSize', 24)

%plot real information
y = 0.10875;
A = line([0,6],[y,y],'Color','k','LineStyle','--');
r = rectangle('Position',[0 0.09275 6 0.032]);
r.FaceColor = [.5 .5 .5 0.1];    