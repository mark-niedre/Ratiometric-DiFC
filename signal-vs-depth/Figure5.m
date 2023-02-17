%%Code for Figure 4
figure;
x=[.75,1,1.5,2];
xn=[.75,1];

% figure;
  tiledlayout(1,3);


 nexttile;
% %Red

 a=[ 1	0.323079111	0.034758496	0.006627009
];
 %semilogy(x,a,'-','MarkerSize',10,'LineWidth',2, 'color','r');
p=plot(x,a,'-','MarkerSize',10,'LineWidth',2, 'color','r');
hold on;
%FRBC
CHIII=[1.0000000,0.215638271];
err=[0.304574923,0.121297093
] ;
errorbar(xn,CHIII,err,'diamond','MarkerSize',10,'LineWidth',2, 'color',[175 4 4]./255);

p.MarkerFaceColor = [1 0 0];
p.MarkerSize = 8;
ax = gca;
  ax.FontSize = 18;
   ylim([0 1.5]);
 xlim([0,2.5]);
  ax = gca;
  ax.FontSize = 18;
p.MarkerFaceColor = [1 0 0];
p.MarkerSize = 8;
ax = gca;
  ax.FontSize = 18;
% legend('640 nm simulation','FR5 µ-sphere','fRBC-150mM[Na+](CHIII)', 'FontSize',12);
legend('640 nm simulation','fRBC(CHIII)', 'FontSize',12);

ylabel('Normalized Mean Fluorescence','FontSize',20);

nexttile;
% % %Green
b=[ 1	0.245355709	0.031447647	0.007535075
];
plot(x,b,'-','MarkerSize',10,'LineWidth',2, 'color',[0 128 0]./255);
hold on;
%Frbc
r18=[1,0.133730774];
err=[0.045179556,0.045026156] ;
errorbar(xn,r18,err,'.','MarkerSize',30,'LineWidth',2,'color',[60 77 20]./255);

 ylim([0 3]);
 ax = gca;
  ax.FontSize = 18;
%   d=[	1	0.245355709	0.031447647	0.007535075];
%   plot(x,d,'--*','MarkerSize',10,'LineWidth',2, 'color',[0 128 0]./255);
 ylim([0, 1.5]);
%  legend('555 nm simulation','Envy Green µ-sphere','fRBC-150mM[Na+](R18)', 'FontSize',12);
 legend('555 nm simulation','fRBC(R18)', 'FontSize',12);
 ax = gca;
  ax.FontSize = 18;
 xlim([0,2.5])
  nexttile;


% % % %Ratio Green (avgs with different optical properties)
 l=[0.794164165	1.000000057	0.897503386	0.755044617
];
p=plot(x,l,'-','MarkerSize',10,'LineWidth',2, 'color',[72 84 153]./255);
hold on;

%microspheres
%errorbar(.75,0.731726242,0.09703938,'v','MarkerSize',10,'LineWidth',2,'color',[109 72 63]./255);
%frbc
 r=[0.677123802,1];
 errc=[0.208805188
0.208015385
] ;
 errorbar(xn,r,errc,'<','MarkerSize',10,'LineWidth',2, 'color','k');
%stdv with different optical properties
err=[0	0.060566532	0.052061246	0.082141567];
errorbar(x,l,err,'MarkerSize',10,'LineWidth',2, 'color',[72 4 156]./255);
p.MarkerFaceColor = [72 4 153]./255;
p.MarkerSize = 8;
ylim([0 1.5]);
xlim([0 2.5]);
 ax = gca;
 ax.FontSize = 18;
 fig=gcf;
 tl=fig.Children;
 xlabel(tl,'Tissue Depth (mm)','FontSize',28);
%  legend('640 nm / 555 nm simulation','FR5 µ-sphere / Envy Green µ-sphere','fRBC-150mM[Na+](CHIII)/(R18)','FontSize',12);
 legend('640 nm / 555 nm simulation','fRBC (CHIII) / (R18)','FontSize',12);

 ylabel('Normalized Ratiometric Signal','FontSize',20);