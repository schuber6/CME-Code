figure
% Plot function.
h = plot(1:10)
ylabel('1')
hold on
box off
% Create second Y axes on the right.
a2 = axes('YAxisLocation', 'Right')
% Hide second plot.
set(a2, 'color', 'none')
set(a2, 'XTick', [])
% Set scala for second Y.
set(a2, 'YLim', [20 25])
ylabel('2')