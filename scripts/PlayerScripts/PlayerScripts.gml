///@function 

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
	
	// Horizontal
	if (tilemap_get_at_pixel(collisionMap, x + hSpeed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(hSpeed) == 1) x += TILE_SIZE - 1;
		hSpeed = 0;
		_collision = true;
	}
	
	// Horizontal Move Commit
	x += hSpeed;
	
	// Vertical
	if (tilemap_get_at_pixel(collisionMap, x, y + vSpeed))
	{
		y -= y mod TILE_SIZE;
		if (sign(vSpeed) == 1) y += TILE_SIZE - 1;
		vSpeed = 0;
		_collision = true;
	}
	
	// Vertical Move Commit
	y += vSpeed;
	
	return _collision;
}

function AttackSlash(){
	if (sprite_index != sprPlayerAttackSlash)
	{
		sprite_index = sprPlayerAttackSlash;
		localFrame = 0;
		image_index = 0;
	}
	
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animationEnd)
	{
		playerState = PlayerStateFree;
		animationEnd = false;
	}
}