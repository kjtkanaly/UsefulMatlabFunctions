function filteredSignal = LowPassFun(inputSignal, A, B, ts, generatePlots)
%-----------------------------------------------------------------------------
% Filter the signal in the time domain. 
filteredSignal = zeros(1, length(inputSignal));

for n = max(length(A), length(B)) : length(inputSignal)

    Aprod = 0;
    Bprod = 0;

    for i = 2 : length(A)
        Aprod = Aprod + A(i) * filteredSignal(n - (i - 1));
    end

    for i = 1 : length(B)
        Bprod = Bprod + B(i) * inputSignal(n - (i - 1));
    end

    filteredSignal(n) = Bprod - Aprod;
end

%-----------------------------------------------------------------------------
% Generate Plots
if generatePlots
    % Take the FFT of the filtered signal
    [inputSignalFFT, ~] = ProduceFFT(inputSignal, ts);
    [filteredSignalFFT, frequency] = ProduceFFT(filteredSignal, ts);

    % Max Value for normalizing
    maxValue = max( ...
               max(abs(inputSignalFFT)), ...
               max(abs(filteredSignalFFT)));

    % Filter Frequency Response
    [filterResponse, angularFreq] = freqz( ...
                                    B, ...
                                    A, ...
                                    length(filteredSignalFFT));
    angularFreq = [(-1 .* flip(angularFreq(2:end, 1))).', angularFreq.'].';
    filterResponse = [flip(filterResponse(2:end, 1)).', filterResponse.'].';

    figure;
    hold on;
    plot(frequency, ...
        mag2db(abs(inputSignalFFT) ./ maxValue), ...
        'LineWidth', 2, 'LineStyle', '--');
    plot(frequency, ...
        mag2db(abs(filteredSignalFFT) ./ maxValue), ...
        'LineWidth', 2);
    plot(angularFreq / pi .* (1/(ts*2)), ...
        mag2db(abs(filterResponse)), ...
        'LineWidth', 2, 'LineStyle', '--');
    hold on;
    hold off;
    ax = gca;
    grid(ax, 'on');
    xlabel("Normalized Frequency")
    legend('Input Signal', 'Filtered Signal', 'Filter Response');
    ylim([-100 0]);
    ax.FontSize = 14;
end
end