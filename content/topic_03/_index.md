+++
title = 'Editor Skripte'
draft = false
weight = 30 
+++


## Inhalte

- Skripte als Erweiterungen in Godot exisiterender Klassen
  - Üblich: Von `Node3D` (oder Kindern) abgeleitete Klassen → Nahezu alle "normalen" Skripte.
  - Nützlich: Ableitungen von [Ressourcen-Klassen](https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html) → Für die Widerverwendung z. B. prozeduraler Assets sehr geeignet.

- Im Editor wirksame Skripte müssen mit [`@tool`](https://docs.godotengine.org/en/stable/tutorials/plugins/running_code_in_the_editor.html) annotiert werden.

- [Klassendeklaration](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html#registering-named-classes): 

  - Mit der Anweisung `class_name` wird der Klassenname der selbst definierten Klasse bestimmt.

  - Mit der Anweisung `extends` wird die Basisklasse, von der die eigene Klasse abgeleitet ist, definiert.

  - Ein mit einem doppelten Kommentarzeigen (`##`) eingeleiteter Kommentar wird an passender Stelle im Godot-Editor als Tooltip-Hilfetext angezeigt.
  
- Um im Godot-Editor an passender Stelle [Icons](https://docs.godotengine.org/en/stable/contributing/development/editor/creating_icons.html) anzuzeigen, müssen die Skripte mit `@icon("res://mein_icon.svg")` annotiert werden und eine passende "mein_icon.svg"-Datei erzeugt werden. Zum Erzeugen einer SVG-Datei, am besten ein [bestehendes Godot-Editor-Icon](https://github.com/godotengine/godot/tree/master/editor/icons) in der freien Software "InkScape" abändern und im eigenen Projekt abspeichern.

- Parameter, die von Nutzern der prozedural erzeugten Assets verändert werden können (wie z. B. der Radius von Kugeln, Zylindern etc. oder die polygonale Aufteilung), sollten im jeweiligen Skript als [`@export`ierte Eigenschaften](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_exports.html) implementiert werden. Zahlreiche Variationen der `@export`-Annotation erlauben die Einstellung der Darstellung des Parameters im Editor und dessen Verwendungszweck (Zahl, Winkel, Farbe, Slider, Dateiname...) sowie die Einschränkung des Wertebereichs. Wie für die Klasse selbst, kann mit einem per doppeltem Kommentarzeichen ('##') eingeleiteter Kommentar ein nützlicher Tooltip im Editor hinterlegt werden.


- Für von `Node3D` abgeleitete Klassen gilt: Initialer Code wie die Initialisierung von prozeduraler Geometrie sollte in einer eigenen Überschreibung der [`Node[3D]`-Methode `_enter_tree`](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-private-method-enter-tree) ausgeführt werden, damit Änderungen an Parametern sofort sichtbar werden.
- Für von ursprünglich von `Resource` abgeleitete Klassen, wie z. B. eine eigene Ableitung der Klasse `ArrayMesh` gilt: Initialer Code wie die Initialisierung von prozeduraler Geometrie sollte in einer eigenen Überschreibung der [`Resource`-Methode `_init()`](https://docs.godotengine.org/en/stable/classes/class_node.html#class-node-private-method-enter-tree) ausgeführt werden, damit Änderungen an Parametern sofort sichtbar werden.



## Aufgabe

- Den kombinierten Beispiel-Code aus dem ArrayMesh-Tutorial und dem MeshDataTool-Tutorial zunächst in einem an ein `MeshInstance3D` attachten Skript zum Laufen bringen (Aufgabe aus letzer Lektion).

- Das Skript durch o. g. Annotationen und Änderungen der Nutzer-definierten Parameter in `@export`ierte Eigenschaften zur Anwendung im Editor aufbereiten.

- Statt der Verwendung als an eine Szenen-Node attachtes Skript soll das Skript als Ableitung von ArrayMesh zur Verfügung gestellt werden und damit von Nutzern in der Liste der auswählbaren Mesh-Typen als Resource für die `Mesh`-Resource beliebiger `MeshInstance3D`-Objekte auswählbar sein.


## Ressourcen

- "Creating your own Resources" in der [Godot-Doku](https://docs.godotengine.org/en/stable/tutorials/scripting/resources.html#creating-your-own-resources)