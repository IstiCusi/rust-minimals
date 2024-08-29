* PMOS Simulation mit Dotierungsparametern

* Definition der Versorgungsspannung für Drain
Vdd_pmos Drain_pmos 0 DC -2V

* Definition der Gate-Spannung (swept)
Vg_pmos Gate_pmos 0 DC 0V

* Definition der Source-Verbindung
Vs_pmos Source_pmos 0 DC 0V

* PMOS-Transistor Definition
Mpmos Drain_pmos Gate_pmos Source_pmos 0 PMOS_MODEL L=1u W=2u
* PMOS: Kanal-Länge = 1µm, Kanal-Breite = 2µm

* Definition des PMOS-Modells (BSIM3 Level-49 Modell)
.model PMOS_MODEL PMOS (LEVEL=49 
+ TOX=2.5E-9              * Gate-Oxid-Dicke: 2.5nm
+ U0=200                  * Lochbeweglichkeit: 200 cm^2/Vs
+ VTH0=-0.7               * Schwellenspannung: -0.7V
+ NDEP=8.0E16             * Substrat-Dotierung: 8.0E16 cm^-3
+ NSUB=5.0E15             * Substrat-Dotierung im Well: 5.0E15 cm^-3
+ XJ=0.12U                * Tiefe der Source/Drain-Regionen: 0.12µm
+ NCH=1.0E17              * Kanaldotierung: 1.0E17 cm^-3
+ LD=0.08U                * Laterale Diffusion von Source/Drain: 0.08µm
+ CGSO=1.2E-10            * Source-Overlap-Kapazität: 1.2E-10 F/m
+ CGDO=1.2E-10            * Drain-Overlap-Kapazität: 1.2E-10 F/m
+ PHI=0.6                 * Fermi-Potenzial: 0.6V
)

* DC Sweep Simulation
.DC Vg_pmos -10 0 0.1

* Ausgabe
.control
  run
  plot i(Vdd_pmos)
.endc

.end

