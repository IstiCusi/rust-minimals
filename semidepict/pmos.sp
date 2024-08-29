* PMOS Simulation mit Dotierungsparametern und Stromdichte

* Versorgungsspannung am Drain
Vdd_pmos Drain_pmos 0 DC -5V
* Gate-Spannung, die gesweept wird
Vg_pmos Gate_pmos 0 DC 0V
* Source ist auf Masse gesetzt
Vs_pmos Source_pmos 0 DC 0V

* PMOS-Transistor Definition mit Modell
Mpmos Drain_pmos Gate_pmos Source_pmos 0 PMOS_MOD L=1u W=2u
* Mpmos: Definiert einen PMOS-Transistor mit einer Kanal-Länge von 1µm und einer Kanal-Breite von 2µm.
* Die Reihenfolge der Knoten: Drain, Gate, Source, Bulk (hier auf Masse gesetzt).

* Definition des PMOS-Modells (BSIM3 Level-49 Modell)
.model PMOS_MOD PMOS (LEVEL=49 
+ TOX=2.5E-9             
+ U0=200                  
+ VTH0=-0.7               
+ NDEP=8.0E16             
+ NSUB=5.0E15             
+ XJ=0.12U                
+ NCH=1.0E17              
+ LD=0.08U                
+ CGSO=1.2E-10            
+ CGDO=1.2E-10            
+ PHI=0.6                 
)

* DC Sweep der Gate-Spannung
.DC Vg_pmos -5 0 0.1

.control
  run
  
  * Berechnung der Absolutwerte
  let abs_vgs_pmos = abs(v(Gate_pmos, Source_pmos))
  let abs_ids_pmos = abs(i(Vdd_pmos))

  * Ausgabe der Absolutwerte
  print abs_vgs_pmos
  print abs_ids_pmos

  * Berechnung und Plot der Stromdichte (in µA/µm²) gegen die Gate-Spannung
  let W = 2u
  let L = 1u
  let area = W * L

  plot (abs(i(Vdd_pmos) / area)*1e6) vs abs(V(Gate_pmos)) title "PMOS Stromdichte vs V_G (µA/µm² vs V)" ylabel "J_D (µA/µm²)" xlabel "V_G (V)"
.endc

.end

