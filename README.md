This folder contains the code for calculating critical detection efficiency by characterization of the classical set with no-click outcomes (Matlab + Yalmip + sdpt3):
- **genQCHSH.m**: generation of quantum probability distribution which violates the CHSH inequality maximally.
- **genQCHSH2.m**: generation of quantum probability distribution which violates the CHSH inequality maximally repeated two times.
- **genQCHSHNM.m**: generation of quantum probability distribution which violates CHSH inequality maximally given a non-maximally entangled state (using optimal measurement from paper citing Eberhard).
- **genQCHSH2NM.m**: generation of quantum probability distribution which violates CHSH inequality maximally given a non-maximally entangled state repeated twice.
- **runSEESAW.m**: generation of quantum probability distribution which violates CHSH inequality maximally using see-saw SDP technique.
- **CHSH.m**: returns the value of CHSH inequality given states and measurements.
- **gen.m**: generation of quantum probability distribution given joint probability distribution and detection efficiency for single CHSH scenario.
- **gen2.m**: generation of quantum probability distribution given joint probability distribution and detetection efficiency for CHSH repeated twice.
- **genStratCHSH.m**: generates determininstic strategies with no-click event for single CHSH scenario.
- **genStratCHSH.m**: generates determininstic strategies with no-click event for CHSH repeated twice i.e. 2 party 4 input 5 outcomes each..
- **allStrategies2CHSH.mat: matrix containing all deterministic strategies with no-click event for CHSH repeated twice i.e. 2 party 4 input 5 outcomes each.
- **control.m**: a sample of a complete run.
- **keyAStrat.mat**: mapping of Alice's local strategies with joint deterministic strategies in allStrategies2CHSH.mat.
- **keyBStrat.mat**: mapping of Bob's local strategies with joint deterministic strategies in allStrategies2CHSH.mat.
- **postProcess.m**: filtering out usefull deterministic strategies and printing their indices. 


