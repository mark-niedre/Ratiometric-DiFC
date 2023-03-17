%Optical Properties of generic tissue
%Prepared Feb. 24, 2015, by SL Jacques

x=[250
275
300
325
350
375
400
425
450
475
500
525
550
575
600
625
650
675
700
725
750
775
800
810
820
825
830
840
850
];
B = 0.002; %dermis water volume fraction (Choudhury et al 2010)
S = 0.75; %dermis from Jacques.
W = 0.65; %dermis water volume fraction (Choudhury et al 2010)
M = 0.0005; %adding a bit of melanosome
musp = 4.3;  %reduced scattering coeff. at 500 nm mm^-1
 f = .64;  %fraction of scattering at 500 nm due to Rayleigh scatterin
 bmie = 0.91;  %scattering power for Mie scattering

%These values for the molar extinction coefficient e in [cm-1/(moles/liter)] were compiled by Scott Prahl using data from
%W. B. Gratzer, Med. Res. Council Labs, Holly Hill, London
%N. Kollias, Wellman Laboratories, Harvard Medical School, Boston
muaod = [10611.2
13840.8
6597.2
8979.6
10657.6
9514
26623.2
32603.2
6281.6
3011.36
2093.28
3249.64
4301.6
5330.8
320
70.76
36.8
28.2
28.56
37.24
51.8
67.72
81.6
86.4
91.6
95.64
97.4
102.2
105.8
];
muao = (2.303)*muaod*(150)/(64500); %
muadd=[11273.6
12195.2
6444
8559.2
12209.2
14219.6
22329.6
48184
10329.2
1504.84
2086.2
3594.4
5341.2
4171.6
1467.72
562
375.012
255.44
262.764
120.368
140.524
121.3
76.172
71.708
69.376
69.332
69.304
69.236
69.132
];
muad = (2.303)*muadd*(150)/(64500); %

%G. M. Hale and M. R. Querry, "Optical constants of water in the 200nm to 
%200 micron wavelength region," Appl. Opt., 12, 555--563, (1973).
muaw = [0.00168
0.00107
0.00067
0.000418
0.000233
0.000117
0.000058
0.000038
0.000028
0.0000247
0.000025
0.000032
0.000045
0.000079
0.00023
0.00028
0.00032
0.000415
0.0006
0.00159
0.0026
0.0024
0.002
0.0019858
0.0023907
0.0028
0.0029069
0.0034707
0.0043
];

%Jacques SL, DJ McAuliffe, (1991)
muam = (67.9).*(x./500).^-3.33;


y=((B*muao)+(B.*(1-S).*muad)+(W.*muaw)+(M.*muam));


semilogy(x,y);
 xlabel('Wavelength (nm)');
 ylabel('Optical Absorption (mm^-1)');
