
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

function PlayerStateFree(){
	
	// Player Movement
	hSpeed = lengthdir_x(inputMagnitude * speedWalk, inputDirection);
	vSpeed = lengthdir_y(inputMagnitude * speedWalk, inputDirection);

	// Check for Collision & Move/Don't
	PlayerCollision();

	// Update Sprite Index

	var _oldSprite = sprite_index;

	if (inputMagnitude != 0)
	{
		direction = inputDirection;
		sprite_index = spriteRun;
	}
	else sprite_index = spriteIdle;

	if (_oldSprite != sprite_index) localFrame = 0;

	// Update Image Index
	PlayerAnimateSprite();
	
	// Change State
	if (keyActivate)
	{
		playerState = PlayerStateRoll;
		moveDistanceRemaining = distanceRoll;
	}
}

function PlayerStateRoll(){
	
	// Get Current Direction
	if (inputDirection == 0) inputDirection = direction;
	
	hSpeed = lengthdir_x(speedRoll, inputDirection);
	vSpeed = lengthdir_y(speedRoll, inputDirection);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedRoll);
	var _collided = PlayerCollision();
	
	//Update Sprite
	sprite_index = spriteRoll;
	var _totalFrames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_DIR * _totalFrames) + ((1 - (moveDistanceRemaining / distanceRoll)) * _totalFrames);
	
	// Change State
	if (moveDistanceRemaining <= 0)
	{
		playerState = PlayerStateFree;
	}
}

function PlayerStatePause(){
	
}

function PlayerStateLock(){
	
}