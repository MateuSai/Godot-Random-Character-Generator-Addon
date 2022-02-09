extends Control

const SPRITESHEET_DATA_UI_SCENE: PackedScene = preload("res://SpritesheetDataUI.tscn")

var example_spritesheet_data: Array = [SpritesheetData.new(preload("res://assets/SmallBurg_village_pack_v1.5/Character/Character_Shadow.png")), SpritesheetData.new(preload("res://assets/SmallBurg_village_pack_v1.5/Character/Character_Skintones.png"), 1, 2), SpritesheetData.new(preload("res://assets/SmallBurg_village_pack_v1.5/Character/Lower Body/pants.png"), 1, 2), SpritesheetData.new(preload("res://assets/SmallBurg_village_pack_v1.5/Character/Lower Body/shoes.png"), 1, 4), SpritesheetData.new(preload("res://assets/SmallBurg_village_pack_v1.5/Character/Top Body/shirts.png"), 1, 3), SpritesheetData.new(preload("res://assets/SmallBurg_village_pack_v1.5/Character/Hairs/hairs.png"), 1, 6)]

onready var spritesheets_container: VBoxContainer = get_node("HBoxContainer/PanelContainer/ScrollContainer/SpritesheetsContainer")
onready var generated_character: TextureRect = get_node("HBoxContainer/GeneratedCharacter")
onready var message_label: Label = get_node("MessagesLabel")
onready var select_path_file_dialog: FileDialog = get_node("SelectPathFileDialog")


func _init() -> void:
	randomize()
	
	
func _ready() -> void:
	for data in example_spritesheet_data:
		var new_spritesheet_data_ui: PanelContainer = SPRITESHEET_DATA_UI_SCENE.instance()
		spritesheets_container.add_child(new_spritesheet_data_ui)
		yield(get_tree().create_timer(0.15), "timeout")
		new_spritesheet_data_ui.initialize(data)
		spritesheets_container.move_child(new_spritesheet_data_ui, new_spritesheet_data_ui.get_index() - 1)


func _on_AddNewImageButton_pressed() -> void:
	var new_spritesheet_data_ui: PanelContainer = SPRITESHEET_DATA_UI_SCENE.instance()
	spritesheets_container.add_child(new_spritesheet_data_ui)
	spritesheets_container.move_child(new_spritesheet_data_ui, new_spritesheet_data_ui.get_index() - 1)


func _on_GenerateButton_pressed() -> void:
	var character_data: Array = []
	for child in spritesheets_container.get_children():
		if child is PanelContainer:
			character_data.append(child.spritesheet_data)
	
	if character_data.size() > 0 and character_data[0].texture:
		generated_character.texture = RandomSpriteGenerator.create(character_data)
	else:
		message_label.show_message("Add one image at least")


func _on_DownloadButton_pressed() -> void:
	if not generated_character.texture or not generated_character.texture.get_data():
		message_label.show_message("No image generated yet")
		return

	select_path_file_dialog.popup_centered_ratio()
	

func _on_SelectPathFileDialog_dir_selected(dir: String) -> void:
	if generated_character.texture.get_data().save_png(dir + "/character.png"):
		message_label.show_message("Error downloading the image")


func _on_ResetButton_pressed() -> void:
	for child in spritesheets_container.get_children():
		if not child is Button:
			child.queue_free()
	
	_on_AddNewImageButton_pressed()
