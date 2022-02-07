tool
extends Sprite

var character_data: Array = [SpritesheetData.new(), SpritesheetData.new(), SpritesheetData.new(), SpritesheetData.new(), SpritesheetData.new(), SpritesheetData.new()]

func _get(property):
	for i in character_data.size():
		if property == "Image " + str(i) + "/Texture":
			return character_data[i].texture
		elif property == "Image " + str(i) + "/Horizontal cells":
			return character_data[i].h_cells
		elif property == "Image " + str(i) + "/Vertical cells":
			return character_data[i].v_cells
		elif property == "Image " + str(i) + "/Ignore start":
			return character_data[i].ignore_start
		elif property == "Image " + str(i) + "/Ignore end":
			return character_data[i].ignore_end
		elif property == "Image " + str(i) + "/Allow empty":
			return character_data[i].allow_empty


func _set(property, value):
	for i in character_data.size():
		if property == "Image " + str(i) + "/Texture":
			character_data[i].texture = value
			return true
		elif property == "Image " + str(i) + "/Horizontal cells" and value:
			character_data[i].h_cells = value
			return true
		elif property == "Image " + str(i) + "/Vertical cells" and value:
			character_data[i].v_cells = value
			return true
		elif property == "Image " + str(i) + "/Ignore start" and value:
			character_data[i].ignore_start = value
			return true
		elif property == "Image " + str(i) + "/Ignore end" and value:
			character_data[i].ignore_end = value
			return true
		elif property == "Image " + str(i) + "/Allow empty":
			character_data[i].allow_empty = value
			return true

func _get_property_list():
	var properties: Array = []
	for i in character_data.size():
		properties.append({
			"hint": PROPERTY_HINT_RESOURCE_TYPE,
			"hint_string": "Texture",
			"usage": PROPERTY_USAGE_DEFAULT,
			"name": "Image " + str(i) + "/Texture",
			"type": TYPE_OBJECT
		})
		properties.append({
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "1,5,or_greater",
			"usage": PROPERTY_USAGE_DEFAULT,
			"name": "Image " + str(i) + "/Horizontal cells",
			"type": TYPE_INT
		})
		properties.append({
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "1,5,or_greater",
			"usage": PROPERTY_USAGE_DEFAULT,
			"name": "Image " + str(i) + "/Vertical cells",
			"type": TYPE_INT
		})
		properties.append({
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,5,or_greater",
			"usage": PROPERTY_USAGE_DEFAULT,
			"name": "Image " + str(i) + "/Ignore start",
			"type": TYPE_INT
		})
		properties.append({
			"hint": PROPERTY_HINT_RANGE,
			"hint_string": "0,5,or_greater",
			"usage": PROPERTY_USAGE_DEFAULT,
			"name": "Image " + str(i) + "/Ignore end",
			"type": TYPE_INT
		})
		properties.append({
			"usage": PROPERTY_USAGE_DEFAULT,
			"name": "Image " + str(i) + "/Allow empty",
			"type": TYPE_BOOL
		})
	return properties


func _enter_tree() -> void:
	texture = RandomSpriteGenerator.create(character_data)
