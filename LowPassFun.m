function filteredSignal = LowPassFun(inputSignal, A, B, ts, generatePlots)

    filteredSignal = zeros(1, length(inputSignal));

    for n = max(length(A), length(B)) : length(inputSignal)
        Aprod = 0;
        Bprod = 0;

        for i = 2 : length(A)
            if isnan(A(i))
                break;
            end

            Aprod = Aprod + A(i) * filteredSignal(n - (i - 1));
        end

        for i = 1 : length(B)
            if isnan(B(i))
                break;
            end

            Bprod = Bprod + B(i) * inputSignal(n - (i - 1));
        end

        filteredSignal(n) = Bprod - Aprod;
    end
    
    if generatePlots
        [filteredSignalFFT, frequency] = ProduceFFT(filteredSignal, ts);

        
    end
end