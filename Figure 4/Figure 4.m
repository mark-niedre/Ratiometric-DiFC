%%Code for Figure 4
figure;
x=[.75,1,1.5,2];

% figure;
  tiledlayout(1,3);

%0mmSD
 nexttile;
% %Green
 b=[1.00000000	0.245355711	0.031447648	0.007535075
];
plot(x,b,'-*','MarkerSize',10,'LineWidth',2, 'color','g');
legend('555nm','FontSize',18);
 ylim([0 1.3]);
  ax = gca;
  ax.FontSize = 14;
ylabel('Normalized Theoretical Peak Amplitude/Background Intensity','FontSize',20);
 xlim([0.5,2])

nexttile;
% % %Red
 a=[1	0.3229796	0.034747791	0.006624967
];
 %semilogy(x,a,'-o','MarkerSize',10,'LineWidth',2, 'color','r');
plot(x,a,'-o','MarkerSize',10,'LineWidth',2, 'color','r');
 legend('640nm','FontSize',18);
ax = gca;
  ax.FontSize = 14;
   ylim([0 1.3]);
 xlim([0.5,2]);

  nexttile;
a=[.75 1 1.5 2];
% % % %Ratio Green (avgs with different optical properties)
 l=[0.759663249	0.956262377	0.858248672	0.722020719
];
plot(a,l,'-^','MarkerSize',10,'LineWidth',2, 'color',[180 84 56]./255);
hold on
%stdv with different optical properties
err=[0	0.057917496	0.044681496	0.059307913];
errorbar(a,l,err,'MarkerSize',10,'LineWidth',2, 'color',[180 84 56]./255);
%  hold on;
% %  % % % %Ratio Blue-Green
%   l=[00.759663249	0.997444741	0.806167505	0.675257226
%  ];
%  plot(a,l,'-x','MarkerSize',10,'LineWidth',2, 'color',[74 171 188]./255);
% %  % % % %Ratio Yellow
%   l=[0.759663249	0.951542389	0.907938575	0.759239361
%  ];
%  plot(a,l,'-v','MarkerSize',10,'LineWidth',2, 'color','y');
% % % % % %Ratio Orange
%   l=[0.759663249	0.87606228	0.879505643	0.785677277
% ];
%  plot(a,l,'-p','MarkerSize',10,'LineWidth',2, 'color',[0.9290, 0.6940, 0.1250]);
%  
% hold off
ylim([0 1.3]);
xlim([.5 2]);
 ax = gca;
 ax.FontSize = 14;
 fig=gcf;
 tl=fig.Children;
  legend('Ratio','FontSize',18);
 xlabel(tl,'Tissue Depth (mm)','FontSize',28);
 ylabel('Normalized Ratiometric Signal','FontSize',20);