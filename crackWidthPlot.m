A = [1, 0.005902; 1, 0.012318; 1,0.012527;1,0.015377;1,0.014036;1,0.015586];
B = [2,0.018922;2,0.030544;2,0.019941;2,0.026608;2,0.026608;2,0.026608]; 
C = [3,0.004821;3,0.024642;3,0.015468;3,0.035103;3,0.024642;3,0.024642]; 
D = [4,0.009382;4,0.023512;4,0.020233;4,0.024013;4,0.023993;4,0.023993]; 
E = [5,0.01138;5,0.028838;5,0.017002;5,0.029346;5,0.021475;5,0.021475]; 


eA = [0.000997,0.002258,0.002295,0.002627,0.002596,0.002812];
eB = [0.003677,0.005674,0.003806,0.005065,0.005065,0.005065];
eC = [0.000934,0.004986,0.003113,0.006939,0.004986,0.004986];
eD = [0.001692,0.004345,0.003805,0.004534,0.004548,0.004548];
eE = [0.002149,0.005143,0.003175,0.005397,0.004012,0.004012];


real(1,:) = A(1,:);
real(2,:) = B(1,:);
real(3,:) = C(1,:);
real(4,:) = D(1,:);
real(5,:) = E(1,:);

close(1,:) = A(2,:);
close(2,:) = B(2,:);
close(3,:) = C(2,:);
close(4,:) = D(2,:);
close(5,:) = E(2,:);

dif(1,:) = A(3,:);
dif(2,:) = B(3,:);
dif(3,:) = C(3,:);
dif(4,:) = D(3,:);
dif(5,:) = E(3,:);

deep(1,:) = A(4,:);
deep(2,:) = B(4,:);
deep(3,:) = C(4,:);
deep(4,:) = D(4,:);
deep(5,:) = E(4,:);

none(1,:) = A(5,:);
none(2,:) = B(5,:);
none(3,:) = C(5,:);
none(4,:) = D(5,:);
none(5,:) = E(5,:);

eq(1,:) = A(6,:);
eq(2,:) = B(6,:);
eq(3,:) = C(6,:);
eq(4,:) = D(6,:);
eq(5,:) = E(6,:);


figure
hold on

realE(1,:) = eA(1);
realE(2,:) = eB(1);
realE(3,:) = eC(1);
realE(4,:) = eD(1);
realE(5,:) = eE(1);

closeE(1,:) = eA(2);
closeE(2,:) = eB(2);
closeE(3,:) = eC(2);
closeE(4,:) = eD(2);
closeE(5,:) = eE(2);

difE(1,:) = eA(3);
difE(2,:) = eB(3);
difE(3,:) = eC(3);
difE(4,:) = eD(3);
difE(5,:) = eE(3);

deepE(1,:) = eA(4);
deepE(2,:) = eB(4);
deepE(3,:) = eC(4);
deepE(4,:) = eD(4);
deepE(5,:) = eE(4);

noneE(1,:) = eA(5);
noneE(2,:) = eB(5);
noneE(3,:) = eC(5);
noneE(4,:) = eD(5);
noneE(5,:) = eE(5);

eqE(1,:) = eA(6);
eqE(2,:) = eB(6);
eqE(3,:) = eC(6);
eqE(4,:) = eD(6);
eqE(5,:) = eE(6);


realPlot = plot(real(:,1),real(:,2),'ro','MarkerSize',10, 'MarkerFaceColor','r');
closePlot = plot(close(:,1),close(:,2),'bs','MarkerSize',10,'MarkerFaceColor','b');
difPlot = plot(dif(:,1),dif(:,2),'g*','MarkerSize',10,'MarkerFaceColor','g');
deepPlot = plot(deep(:,1),deep(:,2),'k*','MarkerSize',10),'MarkerFaceColor','k';
nonePlot = plot(none(:,1),none(:,2),'md','MarkerSize',10,'MarkerFaceColor','m');
% eqPlot = plot(eq(:,1),eq(:,2),'cx','MarkerSize',10,'MarkerFaceColor','c');


errorbar(real(:,1),real(:,2),realE,'ro', 'MarkerSize',0.001,'LineWidth',1.5)
errorbar(close(:,1),close(:,2),closeE,'bo', 'MarkerSize',0.001,'LineWidth',1.5)
errorbar(dif(:,1),dif(:,2),difE,'go', 'MarkerSize',0.001,'LineWidth',1.5)
errorbar(deep(:,1),deep(:,2),deepE,'ko', 'MarkerSize',0.001,'LineWidth',1.5)
errorbar(none(:,1),none(:,2),noneE,'mo', 'MarkerSize',0.001,'LineWidth',1.5)
% errorbar(eq(:,1),eq(:,2),eqE,'co', 'MarkerSize',0.001,'LineWidth',1.5)


title('Distance to lab testing','Interpreter','latex','FontSize', 36)
xlabel('Trial', 'Interpreter','latex','FontSize', 24)
ylabel('Geometric distance (m)','Interpreter','latex','FontSize', 24)
legend([realPlot,closePlot,difPlot,deepPlot,nonePlot], {'real','close','different','deep','none','earthquake'},'Interpreter','latex','FontSize', 24)
set(gca,'FontName','latex','FontSize', 24,'LineWidth',2,'XMinorTick','on',...
    'YMinorTick','on', 'TickLength', [.025 .0125],'Box', 'on','XTick',(1:1:6))
xlim([0 7])


%

