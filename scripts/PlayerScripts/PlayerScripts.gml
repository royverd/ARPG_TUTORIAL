
function PlayerAnimateSprite(){
	
	var _cardinalDirection = CARDINAL_DIR;
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = localFrame + (_cardinalDirection * _totalFrames);
	localFrame += sprite_get_speed(sprite_index) / FRAME_RATE;
	
	// If Animation Loop
	if (localFrame >= _totalFrames)
	{
		animationEnd = true;
		localFrame -= _totalFrames;
	} else animationEnd = false;
}
	
function PlayerCollision(){
	var _collision = false;
	var _entityList = ds_list_create();
	
	// Horizontal
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	}
	
	// Horizontal Entities
	var _entityCount = instance_position_list(x + hSpeed, y, pEntity, _entityList, false);
	var _snapX;
	
	while (_entityCount > NULL)
	{
		var _entityCheck = _entityList[| NULL];
		if (_entityCheck.entCollision == true)
		{
			// Snap as Close as Possible
			if (sign(hSpeed) == EOF) _snapX = _entityCheck.bbox_right + 1;
			else _snapX = _entityCheck.bbox_left-1;
			
			x = _snapX;
			hSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		// else
		ds_list_delete(_entityList, NULL);
		_entityCount--;
	}
	
	
	// Horizontal Move Commit
	x += hSpeed;
	
	ds_list_clear(_entityList);
	
	// Vertical
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}
	
	// Vertical Entities
	var _entityCount = instance_position_list(x , y + vSpeed, pEntity, _entityList, false);
	var _snapY;
	
	while (_entityCount > NULL)
	{
		var _entityCheck = _entityList[| NULL];
		if (_entityCheck.entCollision == true)
		{
			// Snap as Close as Possible
			if (sign(vSpeed) == EOF) _snapY = _entityCheck.bbox_bottom + 1;
			else _snapY = _entityCheck.bbox_top -1;
			
			y = _snapY;
			vSpeed = 0;
			_collision = true;
			_entityCount = 0;
		}
		// else
		ds_list_delete(_entityList, NULL);
		_entityCount--;
	}
	
	
	// Vertical Move Commit
	y += vSpeed;
	
	// Memory Cleanup
	ds_list_destroy(_entityList);
	
	return _collision;
}

