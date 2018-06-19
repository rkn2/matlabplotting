% figure;
% X= [1,1,1;2,2,2;3,3,3]; %settlement data
% Y = [1,2,3;1,2,3;1,2,3]; %eq dat
% Z = [0.10875,0.08919,0.10073;0.09881,0.06841,0.10029;0.10784,0.08308,0.10129];
% contourf(X,Y,Z)
% colormap parula
% title('Geometric distance(m)','Interpreter','latex','FontSize', 24)
% xlabel('EQ information','Interpreter','latex','FontSize', 24)
% ylabel('Settlement information','Interpreter','latex','FontSize', 24)
% 
% Z2 = [0.1013,0.1666,0.090122;0.0878,0.0974,0.090172;0.101025,0.086134,0.094884];

figure;
Y = [1,1;2,2;3,3]; %settlement data
X = [1,2;1,2;1,2]; %eq dat
Z = [0.122, 0.108;0.100,0.0891;0.111,0.100];
contourf(X,Y,Z)
colormap parula
title('Geometric distance(m)','Interpreter','latex','FontSize', 24)
xlabel('Detailed versus Simplified','Interpreter','latex','FontSize', 24)
ylabel('Settlement information','Interpreter','latex','FontSize', 24)

