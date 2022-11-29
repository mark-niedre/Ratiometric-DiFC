%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Code for calculating sensitivity profiles 
%Make sure the mcxlab function is in the same folder as this code
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear cfg
cfg.nphoton=1e8;

cfg.unitinmm=0.25; % 250 um voxel

cfg.vol=uint8(ones(200,200,200));

% define source/det positions
detradius=2;
cfg.issrcfrom0=1;
cfg.srcpos=[100, 96, 0];
cfg.srcdir=[0 0 1];
cfg.detpos=[100, 104, 0 detradius];
cfg.debuglevel='P';

% define GPU settings
cfg.gpuid=1;
cfg.gpuid='11'; % use two GPUs together
cfg.autopilot=1;
cfg.issaveref=1;

% define optical properties, 
cfg.prop=[0 0 1 1; .0025 10 0.9 1.365];

% other simulation settings
cfg.tstart=0;
cfg.tend=5e-9;
cfg.tstep=5e-9;

    [flux1, detp1]=mcxlab(cfg);

    % flip source and detector
    srcpos=cfg.srcpos;
    cfg.srcpos=cfg.detpos(1:3);
    cfg.detpos=[srcpos(1:3) detradius];


    % run the mc simulation 
    [flux2, detp2]=mcxlab(cfg);

    % calculate the Jacobians 
    Jmua1=flux1.data.*flux2.data*cfg.unitinmm^3;

% save sensitivity profiles
% plot one of the slices 
imagesc(log10(abs(squeeze(Jmua1(100,:,:)))))
axis equal;

Jmua1(100,100,20)%Sensitivity at radial artery
Jmua1(100,100,16)
Jmua1(100,100,12)
Jmua1(100,100,8)
Jmua1(100,100,6)
Jmua1(100,100,4)
Jmua1(100,100,3)
Jmua1(100,100,2)
[V,D]=max(Jmua1(100,100,:)) %Max Sensitivity value and depth along z 
