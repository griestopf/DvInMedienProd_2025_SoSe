@icon("res://my_sphere.svg")
@tool

## Dis is a sphere
class_name MySphere
extends ArrayMesh



@export_range(3, 720) var rings := 6:
	set(value):
		rings = value
		recreate_mesh()
	get:
		return rings

@export_range(3, 720) var radial_segments := 6:
	set(value):
		radial_segments = value
		recreate_mesh()
	get:
		return radial_segments

## Des isch de Rohdius
@export var radius: = 1.0:
	set(value):
		radius = value
		recreate_mesh()
	get:
		return radius


func _init():
	recreate_mesh()
	
func recreate_mesh():
	print("Recreate Mesh")
	clear_surfaces()
	var surface_array = []
	surface_array.resize(Mesh.ARRAY_MAX)

	var verts = PackedVector3Array()
	var uvs = PackedVector2Array()
	var normals = PackedVector3Array()
	var indices = PackedInt32Array()

	#######################################
	## Insert code here to generate mesh ##
	#######################################
	# Vertex indices.
	var thisrow = 0
	var prevrow = 0
	var point = 0

	# Loop over rings.
	for i in range(rings + 1):
		var v = float(i) / rings
		var w = sin(PI * v)
		var y = cos(PI * v)

		# Loop over segments in ring.
		for j in range(radial_segments + 1):
			var u = float(j) / radial_segments
			var x = sin(u * PI * 2.0)
			var z = cos(u * PI * 2.0)
			var vert = Vector3(x * radius * w, y * radius, z * radius * w)
			verts.append(vert)
			normals.append(vert.normalized())
			uvs.append(Vector2(u, v))
			point += 1

			# Create triangles in ring using indices.
			if i > 0 and j > 0:
				indices.append(prevrow + j - 1)
				indices.append(prevrow + j)
				indices.append(thisrow + j - 1)

				indices.append(prevrow + j)
				indices.append(thisrow + j)
				indices.append(thisrow + j - 1)

		prevrow = thisrow
		thisrow = point



	surface_array[Mesh.ARRAY_VERTEX] = verts
	surface_array[Mesh.ARRAY_TEX_UV] = uvs
	surface_array[Mesh.ARRAY_NORMAL] = normals
	surface_array[Mesh.ARRAY_INDEX] = indices

	self.add_surface_from_arrays(Mesh.PRIMITIVE_TRIANGLES, surface_array)
	
