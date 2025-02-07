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
	
	// Check for Aggro
	if (++aggroCheck >= aggroCheckDuration)
	{
		aggroCheck = 0;
		
		if (instance_exists(oPlayer)) && (point_distance(x, y, oPlayer.x, oPlayer.y) <= enemyAggroRadius)
		{
				state = ENEMYSTATE.CHASE;
				target = oPlayer;
				
			
		}
	}

}

function SlimeChase() {
	
	// Initialize Chase
	
	sprite_index = sprMove;
	
	if (instance_exists(target))
	{
		
		xTo = target.x;
		yTo = target.y;
		
		var _distanceToGo = point_distance(x, y, xTo, yTo);
		image_speed = ENEMY_CHASE_SPD;
		dir = point_direction(x, y, xTo, yTo);
		if (_distanceToGo > enemySpeed)
		{
			hSpeed = lengthdir_x(enemySpeed, dir);
			vSpeed = lengthdir_y(enemySpeed, dir);
		}
		else
		{
			hSpeed = lengthdir_x(_distanceToGo, dir);
			vSpeed = lengthdir_y(_distanceToGo, dir);
		}
		
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		// Actual Movement & Collision
		EnemyTileCollision();
	}
	
	// Check if At Attack Range
	
	if (instance_exists(target)) && (point_distance(x, y, target.x, target.y) <= enemyAttackRadius)
	{
		state = ENEMYSTATE.ATTACK;
		sprite_index = sprAttack;
		image_index = 0;
		image_speed = 1.0;
		
		// Target xPixels Past Player
		
		xTo += lengthdir_x(ENEMY_ATTACK_OFFSET, dir);
		yTo += lengthdir_y(ENEMY_ATTACK_OFFSET, dir);
		
	}
	
}

function SlimeAttack() {
	
	// Movement Speed
	var _spd = enemySpeed * 2;
	
	// Don't Move While Attacking
	if (image_index < 2) _spd = 0;
	
	// Freeze Animation Mid-air and at Landing
	if (floor(image_index) == 3) || (floor(image_index == 5)) image_speed = 0;
	
	// Jump Range
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	// Begin Landing End of the Animation Once we are Nearly Done
	if (_distanceToGo < 4) && (image_index < 5) image_speed = 1.0;
	
	// Move
	if (_distanceToGo > _spd)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(_spd, dir);
		vSpeed = lengthdir_y(_spd, dir);
		if (hSpeed != 0) image_xscale = sign(hSpeed);
		
		// Commit Movement & Collision Check
		
		if (EnemyTileCollision() == true)
		{
			xTo = x;
			yTo = y;
			
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		if (floor(image_index) == 5)
		{
			stateTarget = ENEMYSTATE.CHASE;
			stateWaitDuration = DEFAULT_ENEMY_STATE_WAIT_DURATION;
			state = ENEMYSTATE.WAIT;
		}	
		
	}
}
	
function SlimeHurt() {
	
	sprite_index = sprHurt;
	var _distanceToGo = point_distance(x, y, xTo, yTo);
	
	if (_distanceToGo > enemySpeed)
	{
		image_speed = 1.0;
		dir = point_direction(x ,y , xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		// Collide & Move, Stop Knockback at Collision
		
		if (EnemyTileCollision())
		{
			xTo = x;
			yTo = y;
			
		}
	}
	else
	{
		x = xTo;
		y = yTo;
		if (statePrevious != ENEMYSTATE.ATTACK) state = statePrevious; else state = ENEMYSTATE.CHASE;
		
		
	}
	
}

function SlimeDie() { 
	
	sprite_index = sprDie;
	image_speed = 1.0;
	var _distanceToGo = point_direction(x, y, xTo, yTo);
	
	if (_distanceToGo > enemySpeed)
	{
		dir = point_direction(x, y, xTo, yTo);
		hSpeed = lengthdir_x(enemySpeed, dir);
		vSpeed = lengthdir_y(enemySpeed, dir);
		
		if (hSpeed != 0) image_xscale = -sign(hSpeed);
		
		// Collide & Move
		EnemyTileCollision();
		
	}
	else
	{
		x = xTo;
		y = yTo
	}
	
	if (image_index + (sprite_get_speed(sprite_index)) / game_get_speed(gamespeed_fps) >= image_number) // Death Animation Finished
	{
		instance_destroy();
		
	}
	
	
}