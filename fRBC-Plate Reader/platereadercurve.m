function [fitresult, gof] = createFit(x, p)
%CREATEFIT(X,P)
%  Create a fit.
%
%  Data for 'plate-reader-short-' fit:
%      X Input (log10([Na+])) : x
%      Y Output (plate reader data): p
%See excel file for details
%  Output:
%      fitresult : a fit object representing the fit.
%      gof : structure with goodness-of fit info.
%  see also sfit file


%% Fit: 'plate-reader'.
[xData, yData] = prepareCurveData( x, p );

% Set up fittype and options.
ft = fittype( 'U + (L-U)/(1 + exp(-4*log(3)*(x-xmid)/xscale80))', 'independent', 'x', 'dependent', 'y' );
opts = fitoptions( 'Method', 'NonlinearLeastSquares' );
opts.Display = 'Off';
opts.Robust = 'LAR';
opts.StartPoint = [3.79 6.58 0.86869470536351 0.0844358455109103];

% Fit model to data.
[fitresult, gof] = fit( xData, yData, ft, opts );

% Plot fit with data.
figure( 'Name', 'plate-reader-short-' );
h = plot( fitresult, xData, yData );
legend( h, 'p vs. x', 'plate-reader-short-', 'Location', 'NorthEast', 'Interpreter', 'none' );
% Label axes
xlabel( 'x', 'Interpreter', 'none' );
ylabel( 'p', 'Interpreter', 'none' );
grid on


