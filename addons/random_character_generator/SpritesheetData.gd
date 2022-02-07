class_name SpritesheetData

var texture: Texture
var h_cells: int = 1
var v_cells: int = 1
var ignore_start: int = 0
var ignore_end: int = 0
var allow_empty: bool = false


#func _init(image: Image, h_cells: int, v_cells: int) -> void:
	#assert(image)
	#assert(h_cells > 0 && v_cells > 0)
	#self.image = image
	#self.h_cells = h_cells
	#self.v_cells = v_cells
