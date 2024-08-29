* NMOS Simulation mit Dotierungsparametern und Absolutwert-Darstellung

* Definition der Versorgungsspannung für Drain
Vdd_nmos Drain_nmos 0 DC 5V

* Definition der Gate-Spannung (swept)
Vg_nmos Gate_nmos 0 DC 0V

* Definition der Source-Verbindung
Vs_nmos Source_nmos 0 DC 0V

* NMOS-Transistor Definition
Mnmos Drain_nmos Gate_nmos Source_nmos 0 NMOS_MODEL L=1u W=2u
* NMOS: Kanal-Länge = 1µm, Kanal-Breite = 2µm

* Definition des NMOS-Modells (BSIM3 Level-49 Modell)
.model NMOS_MODEL NMOS (LEVEL=49 
+ TOX=2.5E-9              * Gate-Oxid-Dicke: 2.5nm
+ U0=450                  * Elektronenbeweglichkeit: 450 cm^2/Vs
+ VTH0=0.7                * Schwellenspannung: 0.7V
+ NDEP=1.2E17             * Substrat-Dotierung: 1.2E17 cm^-3
+ NSUB=1.0E16             * Substrat-Dotierung im Well: 1.0E16 cm^-3
+ XJ=0.15U                * Tiefe der Source/Drain-Regionen: 0.15µm
+ NCH=2.0E17              * Kanaldotierung: 2.0E17 cm^-3
+ LD=0.1U                 * Laterale Diffusion von Source/Drain: 0.1µm
+ CGSO=1.0E-10            * Source-Overlap-Kapazität: 1.0E-10 F/m
+ CGDO=1.0E-10            * Drain-Overlap-Kapazität: 1.0E-10 F/m
+ PHI=0.65                * Fermi-Potenzial: 0.65V
)

* DC Sweep Simulation
.DC Vg_nmos 0 5 0.1

* Ausgabe und Plot der Absolutwerte
.control
  run
  * Messung und Ausgabe der Absolutwerte
  measure abs_vgs_nmos abs(v(Gate_nmos, Source_nmos))
  measure abs_ids_nmos abs(i(Vdd_nmos))
  print abs_vgs_nmos abs_ids_nmos
  
  * Plot der Absolutwerte
  plot abs(i(Vdd_nmos)) title "NMOS Drain Current (Absolute)"
.endc

.end

