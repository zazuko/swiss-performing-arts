# Tasks

## Entwürfe

* RepertoirenID wird ergänzt werden mit ID für Entwürfe als ID
* r_hasSubject -> wird zu blank node Class E33 PerformanceRole
* Klassen-Ding nachschlagen, je nachdem was es ist (wobei ist aktuell nicht zwingend der Fall)

## Masken

* Data Type Maske??
* rc_: conditional
* 

## RepProfi

* Warum ist Spielzeit in Excel eine Relation hasDate?

## Feedback Birk

### STS-Daten

Angaben in der Akteure-Tabelle sind nicht immer sauber. Muss jeweils geklärt werden, ob wir das bereinigen oder ob es auch einfach bei der Migration gemacht erden kann. TBD

### E17 Corporate Bodies

Bsp.: http://data.performing-arts.ch/sts/professionalperformingartscompany/AC_20025
- Attribut type = "professional performing arts company" fehlt. Warum gibt hier statt dessen einen zweiten Typ E17_Professional?
- In der Mapping-Tabelle wird "Name_Corporate_Body" als Attribut "label | official name". Sollen das zwei Attribute sein? Im Moment gibt es nur label.
- Angaben in alternativeLabel sind nicht nach Semikolon gesplittet
- Angabe Kuenstler ist nicht nach Semikolon gesplittet (ist auch an anderen Stellen der Fall)
- Angaben Ort, Kanton und Land ergeben zusammen 1x hasLocation und nicht je Angabe eine Location. Orte jeweils nur einmal anlegen - Basel, BS, CH ist ja eindeutig.
- Angaben in <>-Klammern bei Ort werden nicht als interne Notiz gespeichert
- Status "a" wird so als activeDate übernommen und nicht wie in der Mapping-Tabelle beschrieben in "2016" (bzw. eigentlich 2017) übersetzt.

Bsp.: http://data.performing-arts.ch/sts/professionalperformingartscompany/AC_20144
- Verband: Mapping-Regel "space-separated substrings; skip "x"" wird noch ignoriert. Verbände selbst sind eindeutig und sollten wie Orte nicht dupliziert werden.
- Angabe Dokumente_PA_G wurde nicht übernommen

Bsp.: http://data.performing-arts.ch/sts/professionalperformingartscompany/AC_20076
- Eckdaten_nicht_STS werden nicht aufgelöst in die Attribute "dateOfEstablishment" und "dateOfTermination"

Bsp.: http://data.performing-arts.ch/sts/professionalperformingartscompany/AC_20140
- Angabe "früher: Basel" bei Ort wird nicht als interNote gespeichert

### E9 Performing Arts Production

@Beat: Ich hatte mit Adrian besprochen, dass wir bei E7-E10 zunächst bei einer Klasse bleiben, weil es da noch offene Fragen gibt. Ich hoffe, dass wir uns dadurch nicht andere Probleme einhandeln ... Können wir vielleicht auch noch am Mittwoch besprechen.

Bsp.: http://data.performing-arts.ch/sts/performingartsproduction/400011834120801
- Attribut type "professional" fehlt
- Datentypen bei Attributen sind immer Strings, sollen laut Mapping z.T. aber auch Integers oder Datum sein (Bsp.: Premierendatum/firstPerformanceDate).
- Die verschiedenen Autoren sind im Mapping als Attribute und nicht als Relationen zu Personen definiert, was auch so umgesetzt ist. Aber macht das Sinn? TBD
- ebenfalls entsprechend Mapping umgesetzt, aber zu diskutieren: Aufführungstitel, Originaltitel und Werktitel werden alle zu gleichwertigen title-Attributen. Wie unterscheiden wir die dann? TBD
- PA_TS, PHeft_TS sollten als Relationen isSubjectOf dargestellt werden - soweit nicht "0" oder leer.
- ProdTruppe ist ein zu verknüpfender Corporate Body und kein Attribut!
- Spielort steht in der Mapping-Tabelle als Auffuehrungsstaette und ist eine Venue, kein Attribut.
- Spielzeit ist auch kein Attribut, sondern eine TheatreOperations-Relation.
- Theatercode ist ein Attribut des zu verknüpfenden Corporate Body, nicht der Produktion.


### STA-Daten

Bestand/Fonds / Record Set

Bsp.: http://data.performing-arts.ch/sta/179 (http://catalogue.collectiondeladanse.ch/tanzarchiv/detail.aspx?ID=179)
- Hat keinen RDF-Typ.
- Es fehlt die Typ-Unterscheidung zwischen section und sub-section.
- Ist Entstehungszeitraum mit "t_entstehungszeitraum" korrekt umgesetzt? Verstehe die Mapping-Tabelle an den Stelle nicht. Ist das Datumsformat korrekt? In Scope gibt es da ein ein führendes "+" (<ToDate>+20050628</ToDate>), das man weglassen sollte. Ausserdem sollte das Zielformat kein String sein, oder?
- Die Attribute permissions, conditionsOfUse und accessCategory fehlen.

Serie / Record Set

Bsp.: http://data.performing-arts.ch/sta/1952
- Hat keinen RDF-Typ.
- "Frühere Signaturen" fehlen.
- "Inhalt" als scopeAndContent fehlt.
- "Kompanie" und "Choreograph" fehlen.
- "Archivalienart" fehlt.
- "Verantwortlicher Mitarbeiter" fehlt.
- "Urheberrechtserklärung", "Archivinterne Bemerkung" und "Standort Archiv" existieren in Scope, sind aber weder im Datenmodell noch im Mapping an dieser Stelle vorgesehen. Mit STA besprechen ....
- Die Attribute permissions, conditionsOfUse und accessCategory fehlen.
- Descriptors-Knoten fehlt

Dokument / Item

Bsp.: http://data.performing-arts.ch/sta/4515
- Unterscheidung zwischen aktuellen und früheren Signaturen fehlt.
- Kompanie und Choreograf sind korrekt als Relations markiert, aber noch Attribute. Wie/An welchem Punkt kommen wir zu richtigen Relationen?
- dateOfBirth-Angabe ist hier falsch, weil sie sich nicht auf das Werk, sondern die Choreographin bezieht.

CulturalHeritageObject

Bsp.: http://data.performing-arts.ch/sta/4516
- Unterscheidung zwischen aktuellen und früheren Signaturen fehlt.


>

