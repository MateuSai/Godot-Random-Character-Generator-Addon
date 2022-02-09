class_name SpritesheetData

var texture: Texture
var h_cells: int = 1
var v_cells: int = 1
var ignore_start: int = 0
var ignore_end: int = 0
var allow_empty: bool = false


func _init(texture: Texture = null, h_cells: int = 1, v_cells: int = 1, ignore_start: int = 0, ignore_end: int = 0, allow_empty: bool = false) -> void:
	assert(h_cells > 0 && v_cells > 0)
	assert(ignore_start >= 0 && ignore_end >= 0)
	
	self.texture = texture
	self.h_cells = h_cells
	self.v_cells = v_cells
	self.ignore_start = ignore_start
	self.ignore_end = ignore_end
	self.allow_empty = allow_empty
