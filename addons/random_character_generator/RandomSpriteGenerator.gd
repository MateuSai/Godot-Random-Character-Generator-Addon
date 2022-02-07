class_name RandomSpriteGenerator


static func create(character_data: Array) -> ImageTexture:
	var sprite_image: Image = Image.new()

	for spritesheet_data in character_data:
		if spritesheet_data.texture:
			blend_random_image_part(sprite_image, spritesheet_data)

	var image_texture: ImageTexture = ImageTexture.new()
	if not sprite_image.is_empty():
		image_texture.create_from_image(sprite_image, 0)
	return image_texture
	
	
static func blend_random_image_part(dst: Image, spritesheet_data: SpritesheetData) -> void:
	var num_possible_cells: int = spritesheet_data.h_cells * spritesheet_data.v_cells - spritesheet_data.ignore_start - spritesheet_data.ignore_end + int(spritesheet_data.allow_empty)
	assert(num_possible_cells > 0)
	var random_cell: int = (randi() % (num_possible_cells)) - int(spritesheet_data.allow_empty)
	
	if random_cell == -1:
		return
	else:
		random_cell += spritesheet_data.ignore_start
	
	var cell: Vector2 = Vector2(random_cell / spritesheet_data.v_cells, random_cell / spritesheet_data.h_cells)
	var cell_width: int = int(round(spritesheet_data.texture.get_width() / spritesheet_data.h_cells))
	var cell_height: int = int(round(spritesheet_data.texture.get_height() / spritesheet_data.v_cells))
	
	if dst.is_empty():
		dst.create(cell_width, cell_height, false, Image.FORMAT_RGBA8)
	
	dst.blend_rect(spritesheet_data.texture.get_data(), Rect2(cell.x * cell_width, cell.y * cell_height, cell_width, cell_height), Vector2(0, 0))
