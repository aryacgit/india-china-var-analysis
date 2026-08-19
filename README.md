# Comparative VAR Analysis of India and China

## Overview

This project examines the dynamic relationships between trade openness, inflation, and real interest rates in India and China using Vector Autoregression (VAR) models in R.

The analysis focuses on whether macroeconomic variables interact differently across the two economies and how shocks to one variable propagate through the system over time.

## Research Question

How do trade openness, inflation, and real interest rates interact dynamically in India and China, and how do these relationships differ between the two economies?

## Objectives

- Examine the stationarity of the variables using Augmented Dickey-Fuller (ADF) tests.
- Determine the appropriate VAR lag length using information criteria.
- Estimate separate VAR models for India and China.
- Evaluate model adequacy using residual diagnostics and stability tests.
- Examine predictive relationships using Granger causality tests.
- Analyse the response of macroeconomic variables to shocks using Impulse Response Functions (IRFs).
- Decompose forecast error variance using FEVD.
- Generate five-year forecasts for the variables in each country.

## Data

The analysis uses three macroeconomic variables:

- **Trade Openness** – measure of external-sector integration.
- **Inflation** – inflation rate.
- **Real Interest Rate** – real interest rate.

Separate datasets are used for India and China.

## Methodology

The analysis follows the following workflow:

1. Data preparation and time-series transformation
2. Augmented Dickey-Fuller (ADF) stationarity testing
3. First differencing where required
4. VAR lag-order selection
5. VAR estimation
6. Residual and stability diagnostics
7. Granger causality testing
8. Impulse Response Function (IRF) analysis
9. Forecast Error Variance Decomposition (FEVD)
10. Five-year forecasting

The models are estimated separately for India and China to allow comparison of their dynamic relationships.

## Model Selection

| | India | China |
|---|---:|---:|
| Selected VAR | VAR(2) | VAR(1) |
| Observations | 42 | 36 |

The final VAR specifications were selected using information criteria after testing for stationarity and determining the appropriate lag structure.

## Model Diagnostics

Both models were evaluated for:

- Serial correlation
- ARCH effects
- Residual normality
- VAR stability

The diagnostic tests indicate that the estimated models satisfy the principal diagnostic requirements used in the analysis.

## Key Findings

### India

The Indian VAR indicates stronger short-run interactions among trade openness, inflation, and real interest rates.

Key findings include:

- Lagged real interest rates have a significant negative relationship with trade openness.
- Inflation exhibits significant persistence.
- Lagged trade openness significantly affects inflation.
- Trade openness also has a significant relationship with the real interest rate.
- Granger causality tests indicate that trade openness provides predictive information for inflation and real interest rates.

### China

The Chinese VAR indicates comparatively weaker lagged interactions among the three variables.

Key findings include:

- Trade openness exhibits strong persistence.
- Inflation and real interest rates show relatively weak lagged relationships with the other variables.
- Granger causality tests do not provide evidence of significant lagged predictive relationships among the variables.
- FEVD results indicate greater own-shock dominance for trade openness and inflation.

## India vs China

The comparative analysis suggests that the three-variable system exhibits greater short-run interdependence in India than in China.

| Dimension | India | China |
|---|---|---|
| VAR specification | VAR(2) | VAR(1) |
| Lagged interactions | Stronger | Weaker |
| Granger causality | Significant relationship identified | No significant relationship identified |
| Trade openness | More influenced by other variables | Strong own-shock persistence |
| Cross-variable shock contribution | Greater | Lower for trade openness and inflation |

The results suggest that macroeconomic shocks propagate differently across the two economies within the estimated VAR framework.

## Impulse Response Analysis

Impulse Response Functions are used to examine how shocks to trade openness, inflation, and real interest rates affect the other variables over a ten-period horizon.

## Forecast Error Variance Decomposition

FEVD is used to determine the contribution of shocks to each variable in explaining forecast uncertainty over time.

At longer horizons, the results indicate greater cross-variable contributions to trade openness in India, while trade openness and inflation in China remain more strongly dominated by their own shocks.

## Forecasting

Five-year forecasts were generated for trade openness, inflation, and real interest rates for both countries.

The forecasts illustrate the expected paths under the estimated VAR dynamics, together with forecast uncertainty intervals.

Forecast uncertainty increases with the forecast horizon, particularly for inflation and real interest rates.

## Limitations

- The models use relatively small annual samples.
- Only three endogenous variables are included, so other macroeconomic factors are not explicitly modelled.
- First differencing removes information about long-run relationships in the levels.
- Forecast uncertainty increases substantially at longer horizons.
- Granger causality represents predictive precedence rather than structural causality.
- Results depend on the selected variables, model specification, and sample period.

## Tools & Packages

**Language:** R

**Key packages:**

- `vars`
- `tseries`
- `forecast`

## Repository Structure

```text
India-China-VAR-Analysis/
│
├── README.md
├── india_VAR.R
├── china_VAR.R
├── results.docx
│
├── images/
│   ├── india
│   └── china
│
├── data/
│   ├── india_data.csv
│   └── china_data.csv
└── 
    
