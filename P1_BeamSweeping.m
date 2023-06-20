%% NR SSB Beam Sweeping
%
% This example shows how to employ beam sweeping at both the transmitter
% (gNB) and receiver (UE) ends of a 5G NR system. Using synchronization
% signal blocks (SSB) in P1 Procedure.
clear;
close all;
clc;
%% Random Seed Initialization

rng(211);

%% Simulation Parameters
% Define system parameters for the example. Modify these parameters to
% explore their impact on the system.

prm.NCellID = 1;                    % Cell ID
prm.FreqRange = 'FR1';              % Frequency range: 'FR1' or 'FR2'
prm.CenterFreq = 4.5e9;             % Hz
prm.SSBlockPattern = 'Case A';      % Case A/B/C/D/E
prm.SSBTransmitted = [ones(1,8) zeros(1,0)];   % 4/8 or 64 in length
% Up to 3 GHz 4bits, 
% 3 to 6 GHz 8 bits and 
% Higher than 6GHz, 64 bits

prm.TxArraySize = [8 8];            % Transmit array size, [rows cols]
prm.TxAZlim = [-60 60];             % Transmit azimuthal sweep limits
prm.TxELlim = [-90 0];              % Transmit elevation sweep limits

prm.RxArraySize = [2 2];            % Receive array size, [rows cols]
prm.RxAZlim = [-180 180];           % Receive azimuthal sweep limits
prm.RxELlim = [0 90];               % Receive elevation sweep limits

prm.ElevationSweep = false;         % Enable/disable elevation sweep
%elavation Sweep can be used in FR2 ranges

prm.SNRdB = 20;                     % SNR, dB
fprintf('Due to SNR, our RF condition is %s:', IsGood(prm.SNRdB));
prm.RSRPMode = 'SSSwDMRS';          % {'SSSwDMRS', 'SSSonly'}


%% Functions

function state = IsGood(SNR)
%This function assist us to evaluate the state of SNR dB

    if SNR >= 20
        state = "Excellent";
    elseif 13 <= SNR && SNR < 20
        state = "Good";
    elseif 0 <= SNR && SNR < 13
         state = "Mid Cell ";
    elseif SNR < 0
         state = "Cell edge ";

    end
end


