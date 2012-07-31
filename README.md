Antragsbuch für Landesparteitage
=======================================

Was ist das hier?
-----------------

Für den [Landesparteitag 2012.2](http://wiki.piratenpartei.de/BY:Landesparteitag) des Landesverbandes Bayern der Piratenpartei wird hier ein Antragsbuch (Datei `Antragsbuch.pdf`) aus den Anträgen der [Antragsfabrik](BY:Landesparteitag 2012.2/Antragsfabrik) erzeugt.

- Der Ordner `src/formalien` enthält allgemeine Informationen über das Antragsbuch, sowohl wichtige Hinweise zur GO des Landesparteitages als auch zur Satzung des Landesverbandes Bayern. Zudem Tipps zur Anfahrt zum LPT und Informationen zur Akkreditierung.
- Entsprechend dem [Antragskonzept](http://wiki.piratenpartei.de/Benutzer:TurBor/Antr%C3%A4ge/Antragskonzep] für den LV Bayern und nach Vorgabe der [Antragskommission](http://wiki.piratenpartei.de/BY:Landesparteitag_2012.1/Antragsfabrik/Antragskommission) werden die Anträge in Blöcke gegliedert.

Voraussetzungen
---------------

- Für die Erzeugung des PDFs wird PdfLatex benötigt.
- Für Informationen über die verwendeten Latex-Pakete - siehe Datei `Antragsbuch.tex`.
- Latex kann nicht mit Umlauten in Dateinamen oder im \label{} Latexbefehl umgehen, bitte darauf achten!

Erzeugen eines Dokumentes
-------------------------

Mit `make` wird ein PDF des Antragsbuches erzeugt.

Antragsbuch aktuell halten
--------------------------

- Die Datei `Antragsbuch.tex` enthält wichtige Angaben über, wie etwa Ort oder Datum des LPTs, die aktuell gehalten werden müssen.Dazu müssen diese Variablen angepasst werden: 
	- `\newcommand{\lpt}{Landesparteitag Bayern 2012.2}`
	- `\newcommand{\datum}{15./16. September 2012}`
	- `\newcommand{\halle}{Stadthalle Maxhütte-Haidhof}`
	- `\newcommand{\strasse}{Regensburger Straße 75}`
	- `\newcommand{\plz}{93142}`
	- `\newcommand{\ort}{Maxhütte Haidhof (Oberpfalz)}`
- Die Datei `src/formalien/info-akkreditierung.tex` enthält Angaben über das Antragsbuch, zum Beispiel wann die Anträge zuletzt im Wiki gesichtet wurden, und muss dementsprechend angepasst werden.


Antrag hinzufügen
-----------------

- Jeder Antragsblock erhält einen Unterordner im `src/` Ordner, (Bsp.:`src/strukturantraege/`)
- Für jeden Antrag wird eine Latex Datei mit der Nummer des Antrages als Namen angelegt (Bsp.:`src/strukturantraege/s01.tex`).
- In der Datei `Antragsbuch.tex` wird jeder Antrag mit `\include{src/strukturantraege/s01.tex}` eingebunden.
- Es stehen Befehle für drei Antrasarten zur Verfügung:
	- Sonstiger Antrag

		\sonstigerantrag<br />
		% Antragsnummer<br />
		{X01}<br />
		% Antragstitel<br />
		{Erstellung der Flauschtime}<br />
		% Wikiurl zum Antrag<br />
		{http://wiki.piratenpartei.de/BY:Landesparteitag 2012.1/Antragsfabrik/Flauschtimeerstellung}<br />
		% Antragssteller<br />
		{Heinz Mustermann}<br />
		% Antragstext<br />
		\subsection{Antrag}<br />
		Hier kommt der Antragstext<br />
		\subsection{Begründung}<br />

	- Änderungsantrag

		\anderungsantrag<br />
		% Antragsnummer<br />
		{S01}<br />
		% Antragstitel<br />
		{Verlängerung der Flauschtime}<br />
		% Wikiurl zum Antrag
		{http://wiki.piratenpartei.de/BY:Landesparteitag 2012.1/Antragsfabrik/Flauschtimerverlängerung}<br />
		% Antragssteller<br />
		{Heinz Mustermann}<br />
		% Betrifft<br />
		{Satzung des Landesverbands Bayern / Abschnitt §1}<br />
		% Antragstext<br />
		\subsection{Neuer §: Abschnitt § 2 Flauschtime}<br />
		Hier kommt der Antragstext<br />
		\subsection{Begründung}<br />
		Hier kommt die Begründung<br />
		
	- Positionsantrag

		\positionspapier<br />
		% Antragsnummer<br />
		{P01}<br />
		% Antragstitel<br />
		{Flauschtime}<br />
		% Wikiurl zum Antrag<br />
		{http://wiki.piratenpartei.de/BY:Landesparteitag 2012.1/Antragsfabrik/Flauschtime}<br />
		% Antragssteller<br />
		{Heinz Mustermann}<br />
		% Antragstext<br />
		\subsection{Antrag}<br />
		Hier kommt der Antragstext<br />
		\subsection{Begründung}<br />
		Hier kommt die Begründung<br />

- Wenn Änträge zueinander in Konkurrenz stehen, bitte den Befehl `\konkurrenz{$Antragsnummer$}` hinzufügen. Beispiel: Positionspapier 01 ist ein Konkurrenzantrag zum sonstigen Antrag X01 (warum auch immer).

	\positionspapier{P01}<br />
	{Flauschtime}<br />
	{http://wiki.piratenpartei.de/BY:Landesparteitag 2012.1/Antragsfabrik/Flauschtime}<br />
	{Heinz Mustermann}<br />
	\konkurrenz{X01}<br />
	\subsection{Antrag}<br />
	Hier kommt der Antragstext<br />
	\subsection{Begründung}<br />
	Hier kommt die Begründung

	und:

	\positionspapier{X01}<br />
	{Erstellung der Flauschtime}<br />
	{http://wiki.piratenpartei.de/BY:Landesparteitag 2012.1/Antragsfabrik/Flauschtimeerstellung}<br />
	{Heinz Mustermann}<br />
	\konkurrenz{P01}<br />
	\subsection{Antrag}<br />
	Hier kommt der Antragstext<br />
	\subsection{Begründung}<br />
	Hier kommt die Begründung<br />

- Tagesordnung nach Antragsblöcken: Es steht ein Befehl für die Tagesordnung zur Verfügung, um von dort auf die Antragsseite referenzieren zu können.

	`\topantrag{$Antragsnummer$}{$Antragstitel$}`

Eine Auswahl an Latexbefehlen
-----------------------------

- Aufzählungen mit Nummerierung

	\begin{enumerate}
		\item 1. Punkt
		\item 2. Punkt
	\end{enumerate}

- Aufzählungen

	\begin{itemize}
		\item Punkt
		\item Punkt
	\end{itemize}

- Neuer Abschnitt

	`\par`

- Unterüberschriften
	
	`\subsubsection{Überschrift}`<br />
	`\paragraph{Paragraf unter der Unterüberschrift}`

- Links
	`\url{http://www.piratenpartei.de}`

- Neue Zeile
	
	`\\`

- Anführungszeichen

	`\glqq Wort in Anführungszeichen\grqq\`

Quellen
-------


- <https://github.com/piratenmv/antragsbuch>
- <http://www.awi.me/2012/07/antragsbuch-zum-bezirksparteitag-oberbayern>

Fragen
------

Bei Fragen bitte eine Mail an taltos02@gmail.com schreiben.
