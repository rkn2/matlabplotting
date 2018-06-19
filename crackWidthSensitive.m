A = [1, 0.00589; 1, 0.00612];
B = [2, 0.00587; 2, 0.00622];
C = [3, 0.00587; 3, 0.00641];
D = [4, 0.00563; 4, 0.00742];


eA = [0.00111,0.00104];
eB = [0.00112,0.00117];
eC = [0.00098,0.00109];
eD = [0.00091,0.00129];

higher(1,:) = A(1,:);
higher(2,:) = B(1,:);
higher(3,:) = C(1,:);
higher(4,:) = D(1,:);

lower(1,:) = A(2,:);
lower(2,:) = B(2,:);
lower(3,:) = C(2,:);
lower(4,:) = D(2,:);

figure
hold on

higherE(1,:) = eA(1);
higherE(2,:) = eB(1);
higherE(3,:) = eC(1);
higherE(4,:) = eD(1);

lowerE(1,:) = eA(1);
lowerE(2,:) = eB(1);
lowerE(3,:) = eC(1);
lowerE(4,:) = eD(1);

higherPlot = plot(higher(:,1),higher(:,2),'bs','MarkerSize',10,'MarkerFaceColor','b');
lowerPlot = plot(lower(:,1),lower(:,2),'g*','MarkerSize',10,'MarkerFaceColor','g');


errorbar(higher(:,1),higher(:,2),higherE,'bo', 'MarkerSize',0.001,'LineWidth',1.5)
errorbar(lower(:,1),lower(:,2),lowerE,'go', 'MarkerSize',0.001,'LineWidth',1.5)

names = {'\rho', 'j_{ns}', 'j_{ss}', '\phi'};


title('Distance to lab testing','Interpreter','latex','FontSize', 36)

legend([higherPlot,lowerPlot], {'10% higher','10% lower'},'Interpreter','latex','FontSize', 24)
set(gca,'FontName','latex','FontSize', 24,'LineWidth',2,'XMinorTick','on',...
    'YMinorTick','on', 'TickLength', [.025 .0125],'Box', 'on','XTick',(1:1:4),'xticklabel',names)
xlim([0 5])
xlabel('Parameter', 'Interpreter','latex','FontSize', 24)
ylabel('Geometric distance (m)','Interpreter','latex','FontSize', 24)

%plot real information
y = 0.0059;
A = line([0,6],[y,y],'Color','k','LineStyle','--');
r = rectangle('Position',[0 0.0049 6 0.002]);
r.FaceColor = [.5 .5 .5 0.1];

