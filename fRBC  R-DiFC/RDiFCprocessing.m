close all; clear; clc
%location of processing folder
proccodes_lib = '';

% Location of data
saveDir = '';
%Name of data files
stem1 = '150mM_C1';
stem2 = '150mM_C2';

% Set process flag - do we need data to be pre-processed?22
% If the script cannot find a saved pre-processed file, it will pre-process
% anyways
proc_flag =  true;        
rel_thresh = [5,5]; % multiplicative factor for the moving threshold:  peak threshold is rel_thresh*estimated standard deviation
% Parameters for peak matching routine
coinc_window = 0.03;                              % length (in seconds) of window to search for coincident peaks
% ^ Commented out Default Values

%-----------------------------------------------------------------------------------------------------------------%

addpath(genpath(proccodes_lib))

if saveDir(end) ~= '\'; saveDir = [saveDir '\']; end
fname1 = [saveDir stem1];
fname2 = [saveDir stem2];
fname = stem1(1:end-3);

if ~proc_flag && exist([fname '_proc.mat'], 'file') ~= 0
    disp('Loading pre-processed data')
    
    % Load pre-processed data
    load([fname '_proc.mat'], 'time', 'data_bs', 'params', 'noise', 'peaks', 'thresh_curve', 'in_dat');
else
    disp('Pre-processing data')
    
    % Load data
    load([fname1 '.mat'], 'time', 'data', 'params')
    data_tmp(:,1) = data;
    params_tmp(1) = params;
    load([fname2 '.mat'], 'data', 'params')
    data_tmp(:,2) = data;
    params_tmp(2) = params;
    data = data_tmp;
    params = params_tmp;
    
    % Pre-proc background subtracts data, calculates the noise/ moving peak
    % threshhold, and identifies peak candidates. Processes all data in the
    % data array
  [data_bs, noise, peaks, thresh_curve, in_dat] = preProc(data, time, params, 'RelativeThresh', rel_thresh);
    
    % Save processed data, including parameters for processing
    disp('Saving processed data')
    
    save([fname '_proc.mat'], 'time', 'data_bs', 'params', 'noise', 'peaks', 'thresh_curve', 'in_dat');
end

% Matches coincident peaks b/w two data sets
% (ensure that data_bs is two columns long, and that peaks is two structs long)
disp('Matching coincident peaks')
[coinc_peaks(1), coinc_peaks(2),scores] = matchCoincPeaks(peaks(1), peaks(2), time);
plotPeaks(data_bs, time, coinc_peaks, thresh_curve, params, 'Direction', 'coinc')

proc_dat.noise = noise;
proc_dat.peaks = peaks;
proc_dat.thresh_curve = thresh_curve;

save([fname '_out.mat'], 'time', 'data_bs', 'params', 'in_dat', 'proc_dat', 'coinc_peaks');

% Mean Peak Amplitudes:
mean_pk_amp = [mean(coinc_peaks(1).pks), mean(coinc_peaks(2).pks)];

% Signal to noise ratios:
snr = 20*log10(mean_pk_amp ./ noise);

% Matched mean peak amplitude ratio
mpkar = mean_pk_amp(1) ./ mean_pk_amp(2);

% Print some data to console
outputTable = table(mean_pk_amp', snr', [coinc_peaks.count]',...
    'VariableNames', {'Mean Matched Peak Amplitude', 'Matched Peak SNR', '# Matched Peaks'},...
    'RowNames', {params(1).name, params(2).name});
disp(outputTable)

pkwise_amp_ratio = coinc_peaks(1).pks ./ coinc_peaks(2).pks;
mean_pkwise_amp_ratio = mean(pkwise_amp_ratio);

mean_background = mean(data);

fprintf('Matched mean peak amplitude ratio: %5.3f\n', mpkar);
fprintf('Total peaks in channel 1 (680 nm): %.0f\n', peaks(1).count);
fprintf('Total peaks in channel 2 (580 nm): %.0f\n', peaks(2).count);
fprintf('Average of peakwise amplitude ratio: %.3f\n', mean_pkwise_amp_ratio);

fprintf('\n\n\n--------------------------------------------------------\n')
try
   %  fprintf('Detected %4.2g peaks per min in Fiber 1\n', pk_per_min_fiber_1);
%     fprintf('Detected %4.2g peaks per min in Fiber 2\n', pk_per_min_fiber_2);
%      fprintf('Removed a total of %g coincident peaks\n',coinc_pk_count);
%     fprintf('Peaks candidates found for channel 1: %g\n', peaks(1).count);
%      fprintf('Peaks candidates found for channel 2: %g\n',peaks(2).count);
%     fprintf('Calculated noise for channel 1: %.3f nA\n', noise(1));
%     fprintf('Calculated noise for channel 2: %.3f nA\n', noise(2));
%     fprintf('Estimated channel 1 SNR: %.3f dB\n', snr_fiber_1)
%     fprintf('Estimated channel 2 SNR: %.3f dB\n', snr_fiber_2)
%     fprintf('Average relative threshold for channel 1: %.3f nA\n', mean(thresh_curve(1)));
%     fprintf('Average relative threshold for channel 2: %.3f nA\n', mean(thresh_curve(2)));
    fprintf('Average background level for channel 1: %.3f mV\n',mean_background(1));
  fprintf('Average background level for channel 2: %.3f mV\n',mean_background(2));
      fprintf('Average peak amplitude for channel 1: %.3f nA\n', mean(peaks(1).pks));
      fprintf('Average peak amplitude for channel 2: %.3f nA\n', mean(peaks(2).pks));
       fprintf('Median peak amplitude for channel 1: %.3f nA\n', median(peaks(1).pks));
      fprintf('Median peak amplitude for channel 2: %.3f nA\n', median(peaks(2).pks));
%     fprintf('Peak amplitude standard deviation for channel 1: %.3f nA\n', std(peaks(1).pks));
%     fprintf('Peak amplitude standard deviation for channel 2: %.3f nA\n', std(peaks(2).pks));
  %   fprintf('Largest peak amplitude for channel 1: %.3f nA\n', max(peaks(1).pks));
   %  fprintf('Smallest peak amplitude for channel 1: %.3f nA\n', min(peaks(1).pks));
%     fprintf('Largest peak amplitude for channel 2: %.3f nA\n', max(peaks(2).pks));
%     fprintf('Smallest peak amplitude for channel 2: %.3f nA\n', min(peaks(2).pks));
catch
%      fprintf('Peaks found for channel 1: %g\n', peaks(1).count);
%      fprintf('Peaks found for channel 2: %g\n', peaks(2).count);
%     fprintf('Calculated noise for channel 1: %.3f nA\n', noise(1));
%     fprintf('Calculated noise for channel 2: %.3f nA\n', noise(2));
%         fprintf('Estimated channel 1 SNR: %.3f dB\n', snr_fiber_1)
%         fprintf('Estimated channel 2 SNR: %.3f dB\n', snr_fiber_2)
%     fprintf('Average relative threshold for channel 1: %.3f nA\n', mean(thresh_curve(1)));
%     fprintf('Average relative threshold for channel 2: %.3f nA\n', mean(thresh_curve(2)));
    fprintf('Average background level for channel 1: %.3f mV\n',mean_background(1));
  fprintf('Average background level for channel 2: %.3f mV\n',mean_background(2));
      fprintf('Average peak amplitude for channel 1: %.3f nA\n', mean(peaks(1).pks));
      fprintf('Average peak amplitude for channel 2: %.3f nA\n', mean(peaks(2).pks));
       fprintf('Median peak amplitude for channel 1: %.3f nA\n', median(peaks(1).pks));
      fprintf('Median peak amplitude for channel 2: %.3f nA\n', median(peaks(2).pks));
%     fprintf('Peak amplitude standard deviation for channel 1: %.3f nA\n', std(peaks(1).pks));
%     fprintf('Peak amplitude standard deviation for channel 2: %.3f nA\n', std(peaks(2).pks));
%     fprintf('Largest peak amplitude for channel 1: %.3f nA\n', max(peaks(1).pks));
%     fprintf('Smallest peak amplitude for channel 1: %.3f nA\n', min(peaks(1).pks));
%     fprintf('Largest peak amplitude for channel 2: %.3f nA\n', max(peaks(2).pks));
%     fprintf('Smallest peak amplitude for channel 2: %.3f nA\n', min(peaks(2).pks));
end


