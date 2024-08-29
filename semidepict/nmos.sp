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
+ TOX=2.5E-9             
+ U0=450                  
+ VTH0=0.7                
+ NDEP=1.2E17             
+ NSUB=1.0E16             
+ XJ=0.15U                
+ NCH=2.0E17              
+ LD=0.1U                 
+ CGSO=1.0E-10            
+ CGDO=1.0E-10            
+ PHI=0.65                
)

* DC Sweep der Gate-Spannung
.DC Vg_nmos 0 5 0.1

.control
  run
  
  * Berechnung der Absolutwerte
  let abs_vgs_nmos = abs(v(Gate_nmos, Source_nmos))
  let abs_ids_nmos = abs(i(Vdd_nmos))

  * Ausgabe der Absolutwerte
  print abs_vgs_nmos
  print abs_ids_nmos

  * Berechnung und Plot der Stromdichte (in µA/µm²) gegen die Gate-Spannung
  let W = 2u
  let L = 1u
  let area = W * L

  plot (abs(i(Vdd_nmos) / area)*1e6) vs V(Gate_nmos) title "NMOS Stromdichte vs V_G (µA/µm² vs V)" ylabel "J_D (µA/µm²)" xlabel "V_G (V)"
.endc

.end

