# UsefulMatlabFunctions
### A random set of Matlab functions that migh be useful. ¯\\__(ツ)_/¯

---

## FindMagnitudeOfValue():
  Returns the power of 10 for a given value
  ```
  >> pow = FindMagnitudeOfValue(100)
  
  pow = 
  
   2 
  ```
  
---
  
## AzEl2UV():
  Converts Azimuth and Elvation angles to U/V space
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
