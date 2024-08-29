* NMOS Simulation mit Dotierungsparametern und Stromdichte

* Versorgungsspannung am Drain
Vdd_nmos Drain_nmos 0 DC 5V
* Gate-Spannung, die gesweept wird
Vg_nmos Gate_nmos 0 DC 0V
* Source ist auf Masse gesetzt
Vs_nmos Source_nmos 0 DC 0V

* NMOS-Transistor Definition mit Modell
Mnmos Drain_nmos Gate_nmos Source_nmos 0 NMOS_MOD L=1u W=2u
* Mnmos: Definiert einen NMOS-Transistor mit einer Kanal-Länge von 1µm und einer Kanal-Breite von 2µm.
* Die Reihenfolge der Knoten: Drain, Gate, Source, Bulk (hier auf Masse gesetzt).

* Definition des NMOS-Modells (BSIM3 Level-49 Modell)
.model NMOS_MOD NMOS (LEVEL=49 
+ TOX=2.5E-9              * Gate-Oxid-Dicke in Metern
+ U0=450                  * Elektronenbeweglichkeit in cm^2/Vs
+ VTH0=0.7                * Schwellenspannung in Volt
+ NDEP=1.2E17             * Substrat-Dotierung in cm^-3
+ NSUB=1.0E16             * Substrat-Dotierung im Well in cm^-3
+ XJ=0.15U                * Tiefe der Source/Drain-Regionen in Metern
+ NCH=2.0E17              * Kanaldotierung in cm^-3
+ LD=0.1U                 * Laterale Diffusion von Source/Drain in Metern
+ CGSO=1.0E-10            * Source-Overlap-Kapazität in F/m
+ CGDO=1.0E-10            * Drain-Overlap-Kapazität in F/m
+ PHI=0.65                * Fermi-Potenzial in Volt
)

* DC Sweep der Gate-Spannung
.DC Vg_nmos 0 5 0.1

.control
  run
  * Ausgabe des Drain-Stroms und der Gate-Spannung als Absolutwerte
  measure abs_vgs_nmos abs(v(Gate_nmos, Source_nmos))
  measure abs_ids_nmos abs(i(Vdd_nmos))

  print abs_vgs_nmos abs_ids_nmos

  * Berechnung und Plot der Stromdichte (in µA/µm²) gegen die Gate-Spannung
  let W = 2u
  let L = 1u
  let area = W * L

  plot (i(Vdd_nmos) / area)*1e6 vs V(Gate_nmos) title "NMOS Stromdichte vs V_G (µA/µm² vs V)" ylabel "J_D (µA/µm²)" xlabel "V_G (V)"
.endc

.end

