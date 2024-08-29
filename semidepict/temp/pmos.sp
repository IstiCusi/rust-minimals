* PMOS Simulation - Diese Netlist simuliert das Verhalten eines p-Kanal-MOSFETs (PMOS) unter unterschiedlichen Gate-Spannungen.

* Definition der Versorgungsspannung für Drain
Vdd Drain 0 DC -5V
* Vdd: Name der Spannungsquelle.
* Drain: Der positive Anschluss der Spannungsquelle, der mit dem Drain des PMOS verbunden ist.
* 0: Der negative Anschluss der Spannungsquelle, der mit Masse (GND) verbunden ist.
* DC -5V: Eine konstante Gleichspannung von -5 Volt wird an den Drain angelegt.

* Definition der Gate-Spannung (swept)
Vg Gate 0 DC 0V
* Vg: Name der Spannungsquelle, die das Gate des PMOS steuert.
* Gate: Der positive Anschluss dieser Spannungsquelle, der mit dem Gate des PMOS verbunden ist.
* 0: Der negative Anschluss der Spannungsquelle, der mit Masse (GND) verbunden ist.
* DC 0V: Anfangswert der Gate-Spannung, die später im Sweep variiert wird.

* Definition der Source-Verbindung
Vs Source 0 DC 0V
* Vs: Eine Spannungsquelle, die den Source-Anschluss des PMOS auf Masse setzt.
* Source: Der positive Anschluss, der mit dem Source des PMOS verbunden ist.
* 0: Der negative Anschluss der Spannungsquelle, der ebenfalls mit Masse (GND) verbunden ist.
* DC 0V: Source ist mit Masse verbunden, also 0V.

* Definition des p-Kanal-MOSFETs
Mpmos Drain Gate Source 0 PMOS_MODEL L=1u W=2u
* Mpmos: Instanzname des p-Kanal-MOSFETs.
* Drain, Gate, Source: Anschlüsse des PMOS, die mit den entsprechenden Knoten in der Schaltung verbunden sind.
* 0: Bulk-Anschluss des PMOS, verbunden mit Masse (GND).
* PMOS_MODEL: Verweist auf das Modell des MOSFETs, das später definiert wird.
* L=1u: Kanal-Länge des MOSFETs beträgt 1 Mikrometer (1µm).
* W=2u: Kanal-Breite des MOSFETs beträgt 2 Mikrometer (2µm).

* Definition des MOSFET-Modells (BSIM3 Level-49 Model)
.model PMOS_MODEL PMOS (LEVEL=49 TOX=2.5E-9 U0=200 VTH0=-0.7)
* .model: Beginnt die Definition eines MOSFET-Modells.
* PMOS_MODEL: Name des Modells, das oben referenziert wird.
* PMOS: Gibt an, dass es sich um ein p-Kanal-MOSFET handelt.
* LEVEL=49: Verwendet das BSIM3 Level-49 Modell, ein detailliertes MOSFET-Modell für präzise Simulationen.
* TOX=2.5E-9: Dicke des Gate-Oxids in Metern (2.5nm).
* U0=200: Lochbeweglichkeit (cm^2/Vs).
* VTH0=-0.7: Schwellenspannung (Threshold Voltage) des MOSFETs in Volt (-0,7V).

* DC Sweep Simulation
.DC Vg -5 0 0.1
* .DC: Startet eine DC-Sweep-Analyse.
* Vg: Name der gesteuerten Spannung (Gate-Spannung), die variiert wird.
* -5: Startwert des Sweeps, -5V.
* 0: Endwert des Sweeps, 0V.
* 0.1: Schrittweite des Sweeps, 0,1V pro Schritt.

* Ausgabe
.control
  run
  plot i(Vdd)
.endc
* .control: Beginnt einen Steuerblock für zusätzliche Anweisungen.
* run: Führt die Simulation aus.
* plot i(Vdd): Plottet den Strom, der durch die Vdd-Quelle fließt (Drain-Strom des PMOS).
* .endc: Beendet den Steuerblock.

.end
* .end: Markiert das Ende der Netlist.

