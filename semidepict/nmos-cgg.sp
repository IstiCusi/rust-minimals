* NMOS Cgg vs. Vg Simulation

* Versorgungsspannung am Drain
Vdd_nmos Drain_nmos 0 DC 5V
* Gate-Spannung, die gesweept wird
Vg_nmos Gate_nmos 0 DC 0V
* Source ist auf Masse gesetzt
Vs_nmos Source_nmos 0 DC 0V

* Kleine AC-Signalquelle am Gate hinzufügen
Vac_nmos Gate_nmos 0 AC 1mV

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

* AC Sweep für hohe Frequenzen zur Kapazitätsberechnung
.AC DEC 10 1MEG 10G

* Berechnung der Gesamt-Gate-Kapazität
.measure ac Cgg PARAM='imag(i(Vac_nmos)) / (2 * pi * frequency)'

* Ausgabe der Ergebnisse
.control
  run

  * Plot der Gate-Kapazität vs. Gate-Spannung
  plot Cgg vs V(Gate_nmos) title "NMOS Cgg vs Vg" xlabel "V_G (V)" ylabel "Cgg (F)"
.endc

.end

