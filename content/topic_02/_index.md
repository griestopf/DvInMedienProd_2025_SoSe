+++
title = 'Prozedurale Geometrie'
draft = false
weight = 10 
+++


## Inhalte

- Verschiedene Arten, in Godot Geometrie prozedural zu erzeugen
  - ArrayMesh und SurfaceTool
    - Erzeugen von Godot verwaltete Geometrie in hardware-naher Darstellung
    - User definiert im Wesentlichen Eckpunktlisten (Vertices) mit impliziter oder expliziter Dreiecks-Codierung
    - ArrayMesh ist das klarere Interface
  - MeshDataTool
    - Handhabung von Geometrie eher wie in 3D-Modeling-Software
    - Enthält ZUSATZ-INFORMATIONEN, zusätzlich zu Eckpunkten und Dreiecken (Faces) 
      - Kanten
      - Relationen / Nachbarschaftsverhältnisse
        - Welche Eckpunkte hängen an einem Dreieck
        - Welche Kanten bilden ein Dreieck, welche Dreiecke hängen an einer Kante
  - ImmediateMesh
    - Mesh-Daten vollständig in Verantwortung des Nutzers
    - Geometrie wird on-the-fly während des Renderns an die Grafikkarte als Vertex-Liste mit impliziter oder expliziter Dreiecks-Codierung übergeben.

## Aufgabe

- ArrayMesh-Tutorial und MeshDataTool-Tutorial nachvollziehen und verstehen


## Ressourcen

- Überblick-Seite ["Prozedurale Geoemetrie" in den Godot-Docs](https://docs.godotengine.org/en/stable/tutorials/3d/procedural_geometry/index.html)
- Tutorials in der Godot-Doku
  - **[ArrayMesh Tutorial](https://docs.godotengine.org/en/stable/tutorials/3d/procedural_geometry/arraymesh.html#doc-arraymesh)**
  - **[MeshDataTool Tutorial](https://docs.godotengine.org/en/stable/tutorials/3d/procedural_geometry/meshdatatool.html#doc-meshdatatool)**
  - [SurfaceTool Tutorial](https://docs.godotengine.org/en/stable/tutorials/3d/procedural_geometry/surfacetool.html#doc-surfacetool)
  - [ImmediateMesh Tutorial](https://docs.godotengine.org/en/stable/tutorials/3d/procedural_geometry/immediatemesh.html#doc-immediatemesh)

