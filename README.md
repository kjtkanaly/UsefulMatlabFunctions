# UsefulMatlabFunctions
### A random set of Matlab functions that migh be useful. ¯\\__(ツ)_/¯

---

## FindMagnitudeOfValue():
  Returns the power of 10 for a given value.
  ```
  >> pow = FindMagnitudeOfValue(100)
  
  pow = 
  
   2 
  ```
  
---
  
## AzEl2UV():
  Converts Azimuth and Elvation angles to U/V space.
  ```
  >> Az = 40; El = 0;
  >> tiltAz = 0; tiltEl = 30;
  >> [u, v, w] = AzEl2UV(Az, El, tiltAz, tiltEl)

u =

   -0.6428

v =

   -0.3830

w =

    0.6634
  ```
  
---

## LowPassFun():
  Filters a given input signal using the provided low-pass coefficients.
  ```
  >> filteredSignal = LowPassFun(inputSignal, A, B, ts, generatePlots)
  ```
  ![LowPass Function](https://user-images.githubusercontent.com/54219067/209829699-9610e3e1-8c62-4c7b-bc72-d122b1e17e54.png)
  
---

## ProduceFFT():
  Calculates the N sized FFT of the input signal. The value of N is the first power of 2 that is larger than the size of the input signal.
  ```
  >> f = 5e6;
  >> T = 1/f;
  >> ts = 1e-10;
  >> time = 0:ts:T*3;
  >> signal = cos(2 .* pi .* f .* time);
  >> 
  >> [signalFFT, frequency] = ProduceFFT(signal, ts)
  ```
  ![FFT Image](https://user-images.githubusercontent.com/54219067/209831796-779819db-2195-4d0e-b77b-3734b8a14e58.png)

  
