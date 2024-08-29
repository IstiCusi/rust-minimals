* NMOS Simulation mit Dotierungsparametern, Absolutwert-Darstellung und Stromdichte

* Definition der Versorgungsspannung für Drain
Vdd_nmos Drain_nmos 0 DC 5V
* Vdd_nmos: Versorgungsspannung für den Drain des NMOS-Transistors, 5V.
* Der positive Anschluss ist mit dem Drain verbunden, der negative mit Masse (GND).

* Definition der Gate-Spannung (gesweept)
Vg_nmos Gate_nmos 0 DC 0V
* Vg_nmos: Steuert die Gate-Spannung des NMOS-Transistors.
* Die initiale Spannung beträgt 0V, und sie wird später in der Simulation gesweept.

* Definition der Source-Verbindung
Vs_nmos Source_nmos 0 DC 0V
* Vs_nmos: Source des NMOS-Transistors ist mit Masse (GND) verbunden.

* NMOS-Transistor Definition
Mnmos Drain_nmos Gate_nmos Source_nmos 0 NMOS_MODEL L=1u W=2u
* Mnmos: Definiert einen NMOS-Transistor mit einer Kanal-Länge (L) von 1µm und einer Kanal-Breite (W) von 2µm.
* Die Verbindungen sind:
* - Drain: Verbunden mit dem Drain-Anschluss (Drain_nmos)
* - Gate: Verbunden mit dem Gate-Anschluss (Gate_nmos)
* - Source: Verbunden mit dem Source-Anschluss (Source_nmos)
* - Bulk: Verbunden mit Masse (0V)

* Definition des NMOS-Modells (BSIM3 Level-49 Modell)
.model NMOS_MODEL NMOS (LEVEL=49 
+ TOX=2.5E-9              * Gate-Oxid-Dicke: 2.5nm (wichtiger Parameter für Kapazitäten und Schwellenspannung)
+ U0=450                  * Elektronenbeweglichkeit: 450 cm²/Vs (Einfluss auf den Kanalwiderstand und die Geschwindigkeit des Transistors)
+ VTH0=0.7                * Schwellenspannung: 0.7V (Spannung, bei der der Transistor beginnt, leitend zu werden)
+ NDEP=1.2E17             * Substrat-Dotierung: 1.2E17 cm⁻³ (Einfluss auf die Schwellenspannung und das elektrische Feld im Kanal)
+ NSUB=1.0E16             * Substrat-Dotierung im Well: 1.0E16 cm⁻³ (dotiertes Substrat für die Bulk-Region)
+ XJ=0.15U                * Tiefe der Source/Drain-Regionen: 0.15µm (bestimmt die Ausdehnung der pn-Übergänge)
+ NCH=2.0E17              * Kanaldotierung: 2.0E17 cm⁻³ (Einfluss auf die Inversionsschicht und die Schwellenspannung)
+ LD=0.1U                 * Laterale Diffusion von Source/Drain: 0.1µm (Einfluss auf die effektive Kanal-Länge)
+ CGSO=1.0E-10            * Source-Overlap-Kapazität: 1.0E-10 F/m (Kapazität zwischen Gate und Source durch Overlap)
+ CGDO=1.0E-10            * Drain-Overlap-Kapazität: 1.0E-10 F/m (Kapazität zwischen Gate und Drain durch Overlap)
+ PHI=0.65                * Fermi-Potenzial: 0.65V (Beeinflussung der Schwellenspannung und des Substratpotenzials)
)

* DC Sweep Simulation
.DC Vg_nmos 0 5 0.1
* Sweep der Gate-Spannung Vg_nmos von 0V bis 5V in Schritten von 0.1V.
* Ziel ist es, die I_D-V_G-Kurve zu erzeugen, um das Verhalten des NMOS-Transistors zu analysieren.

* Ausgabe und Plot der Absolutwerte
.control
  run
  * Durchführung der Simulation und Berechnung von Absolutwerten
  measure abs_vgs_nmos abs(v(Gate_nmos, Source_nmos))
  * Berechnet den Absolutwert der Gate-Source-Spannung

  measure abs_ids_nmos abs(i(Vdd_nmos))
  * Berechnet den Absolutwert des Drain-Stroms

  print abs_vgs_nmos abs_ids_nmos
  * Ausgabe der berechneten Absolutwerte

  let W = 2u
  let L = 1u
  let area = W * L
  * Berechnung der Kanalfläche für die Stromdichte

  plot (i(Vdd_nmos) / area)*1e6 vs V(Gate_nmos) title "NMOS Stromdichte vs V_G (µA/µm² vs V)" ylabel "J_D (µA/µm²)" xlabel "V_G (V)"
  * Plot der Stromdichte (in µA/µm²) gegen die Gate-Spannung V_G
.endc

.end

