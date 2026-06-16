# FAO-56-Penman-Monteith-Reference-Evapotranspiration-ETo-Calculation-in-MATLAB
MATLAB code for FAO-56 Penman-Monteith reference evapotranspiration (ETo) estimation using meteorological observations.
# FAO-56 Penman-Monteith Reference Evapotranspiration (ETo) Calculation in MATLAB

## Overview

This repository contains a MATLAB implementation of the FAO-56 Penman-Monteith method for estimating daily reference evapotranspiration (ETo). The script computes ETo using standard meteorological observations including air temperature, relative humidity, solar radiation, wind speed, latitude, and elevation.

The implementation follows the methodology described in the FAO Irrigation and Drainage Paper No. 56:

Allen, R.G., Pereira, L.S., Raes, D., and Smith, M. (1998). Crop Evapotranspiration: Guidelines for Computing Crop Water Requirements. FAO Irrigation and Drainage Paper 56.

## Input Variables

The model requires the following daily meteorological variables:

* Maximum air temperature (°C)
* Minimum air temperature (°C)
* Maximum relative humidity (%)
* Minimum relative humidity (%)
* Solar radiation (MJ m⁻² day⁻¹)
* Wind speed at 2 m height (m s⁻¹)
* Latitude (degrees)
* Elevation (m above sea level)

## Methodology

The script computes:

1. Mean air temperature
2. Atmospheric pressure
3. Psychrometric constant
4. Saturation vapor pressure
5. Actual vapor pressure
6. Solar geometry parameters
7. Extraterrestrial radiation
8. Clear-sky radiation
9. Net shortwave radiation
10. Net longwave radiation
11. Net radiation
12. Radiation component of evapotranspiration
13. Aerodynamic (wind) component of evapotranspiration
14. Daily reference evapotranspiration (ETo)

## Output

The primary output is:

ET_0

where ET_0 represents the daily reference evapotranspiration expressed in millimeters per day (mm day⁻¹).

## Applications

This code can be used for:

* Agricultural water management
* Irrigation scheduling
* Drought monitoring
* Hydrological studies
* Climate change impact assessments
* Water resource planning

## Software Requirements

* MATLAB R2018a or later

## Author

Dr. Tagele Mossie Aschale

## License

This repository is released for research and educational purposes.

