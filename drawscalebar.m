
%scentific
figure1 = figure('Color',[1 1 1]);
cb = colorbar;
axis off

colormap('jet');
TickMin = -8.56E03;
TickMax = 6.44E05;
NumTick = 6;
sigfigs = 2;
fmt = sprintf('%%.%df',sigfigs-1);
YTick = linspace(TickMin,TickMax,NumTick);
YTickLabel = {};
for i = 1:length(YTick)
    YTickLabel{i} = sprintf('%.2E',YTick(i));
end


%vertical
 set(cb,'Position',...
      [0.496669694068501 0.715966386554625 0.0419315775027976 0.195798319327735],...
      'YTick', YTick, 'YTickLabel', YTickLabel)

% %horizontal
% set(cb,'location','southoutside','YTick', YTick, 'YTickLabel', YTickLabel)

set(cb,'TickLabelInterpreter','latex','FontSize', 24)
caxis([TickMin,TickMax])
caxis([TickMin,TickMax])
%title({'Displacement';'magnitude (m)'})
%title('Max P. Stress')