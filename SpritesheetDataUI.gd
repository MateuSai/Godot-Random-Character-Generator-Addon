extends VBoxContainer

var spritesheet_data: SpritesheetData = SpritesheetData.new()

onready var texture_rect: TextureRect = get_node("HBoxContainer/Image/TextureRect")
onready var file_dialog: FileDialog = get_node("FileDialog")


func _on_ChangeImageButton_pressed() -> void:
	file_dialog.popup_centered_ratio()
	
	
func _on_FileDialog_file_selected(path: String) -> void:
	var texture = load(path)
	if not texture is Texture:
		return
	
	texture_rect.texture = texture
	spritesheet_data.texture = texture


func _on_HCells_value_changed(value: int) -> void:
	spritesheet_data.h_cells = value


func _on_VCells_value_changed(value: int) -> void:
	spritesheet_data.v_cells = value


func _on_IgnoreStart_value_changed(value: int) -> void:
	spritesheet_data.ignore_start = value


func _on_IgnoreEnd_value_changed(value: int) -> void:
	spritesheet_data.ignore_end = value


func _on_AllowEmpty_toggled(pressed: bool) -> void:
	spritesheet_data.allow_empty = pressed
