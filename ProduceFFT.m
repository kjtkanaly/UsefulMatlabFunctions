function [signalFFT, frequency] = ProduceFFT(inputSignal, ts)
    n = 2^(nextpow2(length(inputSignal)));
    fs = 1/ts;
    frequency = ((-n / 2) : (n / 2 - 1))*(fs / n);
    signalFFT = fftshift(fft(inputSignal, n));
end