close all;
clear all;
set(0,'DefaultFigureWindowStyle','docked')
%%

value = 0.023;
pow = FindMagnitudeOfValue(value);
disp("Power of " + value + ": " + pow);


%% Earth to Antenna Angles

Az = -40:1:40;
El = 0:1:40;

Az = 40;
El = 0;

[Az, El] = meshgrid(Az, El);

Az = reshape(Az.', [1, size(Az,1) * size(Az,2)]);
El = reshape(El.', [1, size(El,1) * size(El,2)]);

tiltAz = 0;
tiltEl = 30;

[u, v, w] = AzEl2UV(Az, El, tiltAz, tiltEl);

figure
scatter(u, v);


%%

% i = zeros(10,10);
% q = zeros(10,10);

% for index = 1:size(i,1)
for index = 1:10

	i = zeros(1,2*index);
	q = zeros(1,3*index);

	list.i{index, 1} = i;
	list.q{index, 1} = q;
	list.dwellNumber(index, 1) = index;

end

dwellCount = 2;
i_data = list.i{dwellCount,:};
dwell = list.dwellNumber(dwellCount, 1);

% figure
% plot(list.i{2,:})


%%

f = 10e5;
T = 1/f;
ts = 1e-9;
time = 0:ts:T*3;

signal = cos(2.*pi.*f.*time) + 1j.*sin(2.*pi.*f.*time);

time(end - 750: end) = [];
signal(end - 750: end) = [];

figure
subplot(2,1,1)
plot(time,real(signal))
grid on;

n = 2^nextpow2(length(signal));
fs = 1/(time(2) - time(1));
freq = (-n/2:n/2-1)*(fs/n);
Signal = fftshift(fft(signal,n));

subplot(2,1,2)
plot(freq./10^6, pow2db(abs(Signal)),'linewidth',2)
grid on;


%% Low-Pass Fun

A = 1;
B = [-0.000147145293597527, 0.00194006759141466, 0.00604348748422466, ... 
    0.00553908685178508, -0.00891356445209553, -0.0326577167451628, ...
    -0.0358004365559411, 0.0187653272721305, 0.133959140441493, ...
    0.256616373638232, 0.309717036751832, 0.256616373638232, ...
    0.133959140441493, 0.0187653272721305, -0.0358004365559411, ...
    -0.0326577167451628, -0.00891356445209553, 0.00553908685178508, ...
    0.00604348748422466, 0.00194006759141466, -0.000147145293597527];

fs = 12e6;
ts = 1/fs;
timeAxis = 0:ts:1e-3; 
signal = sin(2 .* pi .* 0.2e6 .* timeAxis) + ...
         sin(2 .* pi .* 1.5e6 .* timeAxis) + ...
         sin(2 .* pi .* 4e6 .* timeAxis);

[signalFFT, frequency] = ProduceFFT(signal, ts);

% figure;
% subplot(2,1,1)
% plot(timeAxis .* 10^3, real(signal), 'LineWidth', 2)
% grid on;
% 
% subplot(2,1,2)
% plot(frequency .* 10^-6, mag2db(abs(signalFFT)), 'LineWidth', 2)
% grid on;

filteredSignal = LowPassFun(signal, A, B, ts, true);





