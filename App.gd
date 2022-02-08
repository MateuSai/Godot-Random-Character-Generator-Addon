extends Control

const SPRITESHEET_DATA_UI_SCENE: PackedScene = preload("res://SpritesheetDataUI.tscn")

onready var spritesheets_container: VBoxContainer = get_node("HBoxContainer/PanelContainer/ScrollContainer/SpritesheetsContainer")
onready var generated_character: TextureRect = get_node("HBoxContainer/GeneratedCharacter")
onready var message_label: Label = get_node("MessagesLabel")
onready var select_path_file_dialog: FileDialog = get_node("SelectPathFileDialog")


func _on_AddNewImageButton_pressed() -> void:
	var new_spritesheet_data_ui: VBoxContainer = SPRITESHEET_DATA_UI_SCENE.instance()
	spritesheets_container.add_child(new_spritesheet_data_ui)
	spritesheets_container.move_child(new_spritesheet_data_ui, new_spritesheet_data_ui.get_index() - 1)


func _on_GenerateButton_pressed() -> void:
	var character_data: Array = []
	for child in spritesheets_container.get_children():
		if child is VBoxContainer:
			character_data.append(child.spritesheet_data)
	
	if character_data.size() > 0:
		generated_character.texture = RandomSpriteGenerator.create(character_data)


func _on_DownloadButton_pressed() -> void:
	if not generated_character.texture or not generated_character.texture.get_data():
		message_label.show_message("No image generated yet")
		return

	select_path_file_dialog.popup_centered_ratio()
	

func _on_SelectPathFileDialog_dir_selected(dir: String) -> void:
	if generated_character.texture.get_data().save_png(dir + "/character.png"):
		message_label.show_message("Error downloading the image")
