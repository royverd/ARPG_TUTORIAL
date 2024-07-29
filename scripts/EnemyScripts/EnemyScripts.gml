
function SlimeWander() {
	
	sprite_index = sprMove;
	
	// At Destination OR Aborted
	
	if ((x == xTo) && (y == yTo)) || (timePassed > enemyWanderDistance / enemySpeed)
	{
		hSpeed = 0;
		vSpeed = 0;
		
		// End Move Animation
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		// Set New Destination
		if (++wait >= waitDuration)
		{
			wait = 0;
			timePassed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-HALF_ANGLE, HALF_ANGLE);
			xTo = x + lengthdir_x(enemyWanderDistance, dir);
			yTo = y + lengthdir_y(enemyWanderDistance, dir);
		}
		
	}
	else // Move Towards New Destination
	{
		timePassed++;
		image_speed = 1.0;
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		var _speedThisFrame = enemySpeed;
		if (_distanceToGo < enemySpeed) _speedThisFrame = _distanceToGo;
		hSpeed = lengthdir_x(_speedThisFrame, dir);
		vSpeed = lengthdir_y(_speedThisFrame, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		// Collide & Move
		var _collided = EnemyTileCollision();
		
		
	}

}
	
function EnemyTileCollision() {
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