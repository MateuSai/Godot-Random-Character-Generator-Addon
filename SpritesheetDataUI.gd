extends Container

var spritesheet_data: SpritesheetData = SpritesheetData.new()

onready var app: Control = get_tree().root.get_node("App")

onready var texture_rect: TextureRect = get_node("VBoxContainer/HBoxContainer/Image/TextureRect")
onready var h_cells_spin_box: SpinBox = get_node("VBoxContainer/GridContainer/HCells/SpinBox")
onready var v_cells_spin_box: SpinBox = get_node("VBoxContainer/GridContainer/VCells/SpinBox")
onready var ignore_start_spin_box: SpinBox = get_node("VBoxContainer/GridContainer/IgnoreStart/SpinBox")
onready var ignore_end_spin_box: SpinBox = get_node("VBoxContainer/GridContainer/IgnoreEnd/SpinBox")
onready var allow_empty_check_box: CheckBox = get_node("VBoxContainer/AllowEmpty/CheckBox")
onready var file_dialog: FileDialog = get_node("FileDialog")


func initialize(data: SpritesheetData) -> void:
	self.spritesheet_data = data
	
	_add_texture(data.texture)
	h_cells_spin_box.value = data.h_cells
	v_cells_spin_box.value = data.v_cells
	ignore_start_spin_box.value = data.ignore_start
	ignore_end_spin_box.value = data.ignore_end
	allow_empty_check_box.pressed = data.allow_empty


func _on_ChangeImageButton_pressed() -> void:
	if OS.get_name() == "HTML5":
		var image: Image = Image.new()
		yield(HTML5File.load_image(image), "completed")
		if not image:
			app.message_label.show_message("Error while loading the image")
			return
		var image_texture: ImageTexture = ImageTexture.new()
		image_texture.create_from_image(image, 0)
		_add_texture(image_texture)
	else:
		file_dialog.popup_centered_ratio()
	
	
func _on_FileDialog_file_selected(path: String) -> void:
	var texture = load(path)
	if not texture is Texture:
		app.message_label.show_message("This file is not an image")
		return
	
	_add_texture(texture)
	
	
func _add_texture(texture: Texture) -> void:
	texture_rect.texture = texture
	var texture_aspect_ratio: float = float(texture.get_width()) / texture.get_height()
	texture_rect.rect_min_size.y = texture_rect.rect_size.x / texture_aspect_ratio
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


func _on_RemoveButton_pressed() -> void:
	queue_free()


func _on_MoveUpButton_pressed() -> void:
	var current_index: int = get_index()
	if current_index == 0:
		return
	get_parent().move_child(self, current_index - 1)


func _on_MoveDownButton_pressed() -> void:
	var current_index: int = get_index()
	if current_index == get_parent().get_child_count() - 2:
		return
	get_parent().move_child(self, current_index + 1)
