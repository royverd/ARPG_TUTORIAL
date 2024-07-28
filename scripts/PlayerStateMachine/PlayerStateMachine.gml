
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
	
	// Attack Logic
	if (keyAttack)
	{
		playerState = PlayerStateAttack;
		PlayerStateAttack = AttackSlash;
	}
	
	
	// Change State
	if (keyActivate)
	{
		
		// 1 - Check for Entity
		// 2 - No Entity or non-interactable Entity
			// 2a - If Carrying Something, Throw
			// 2b - Otherwise, Roll
		// 3 - Interactable Entity
		// 4 - If NPC Entity, Face Player
		
		// 1 - Check for Entity
		var _activateX = lengthdir_x(INTERACTION_DISTANCE, direction);
		var _activateY = lengthdir_y(INTERACTION_DISTANCE, direction);
		
		// Interaction Hitbox
		activate = instance_position(x + _activateX, y - INTERACTION_DISTANCE + _activateY, pEntity);
		//activate = collision_circle(x + _activateX, y - INTERACTION_DISTANCE + _activateY, INTERACTION_RADIUS, pEntity, false, true);
		
		// 2 - No Entity or non-interactable Entity 
		if (activate == noone || activate.entActivateScript == -1 || global.iLifted != noone) //ALTERED
		{
			// 2a - Throw if Carrying
			if (global.iLifted != noone)
			{
				show_debug_message("ATTEMPTING THROW");
				PlayerThrow();
			}
			else // 2b - Otherwise
			{
				playerState = PlayerStateRoll; // Roll Instead
				moveDistanceRemaining = distanceRoll;
			}

		}
		// 3 - Interactable Entity
		else
		{
			show_debug_message("INTERACTABLE ENTITY");
			script_execute_ext(activate.entActivateScript, activate.entActivateArgs);
			
			// 4 - If NPC Entity, Face Player
			if (activate.entNPC)
			{
				show_debug_message("NPC");
				with(activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
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
	
	// Collision Interactions
	if (_collided)
	{
		playerState = PlayerStateBonk;
		moveDistanceRemaining = distanceBonk;
		ScreenShake( 3, 30);
	}
}

function PlayerStateBonk(){
	
	// Get Current Direction
	//if (inputDirection == 0) inputDirection = direction;
	
	hSpeed = lengthdir_x(speedBonk, direction - FULL_CIRCLE/2);
	vSpeed = lengthdir_y(speedBonk, direction - FULL_CIRCLE/2);
	
	moveDistanceRemaining = max(0, moveDistanceRemaining - speedBonk);
	var _collided = PlayerCollision();
	
	//Update Sprite
	if(sprite_index != sprPlayerHurt) sprite_index = sprPlayerHurt;
	image_index = CARDINAL_DIR - 2;
	
	// Change Height (Arc)
	z = sin(((moveDistanceRemaining / distanceBonk) * pi)) * distanceBonkHeight;
	
	// Change State
	if (moveDistanceRemaining <= 0)
	{
		playerState = PlayerStateFree;
	}
	
}

function PlayerStatePause(){
	
}

function PlayerStateLocked(){
	// Does Nothing
}
	
function PlayerStateAttack(){
	script_execute(playerStateAttack);
}

function PlayerStateTransition(){
	// Movement
	PlayerCollision();
	
	// Update Image Index
	PlayerAnimateSprite();
	
}
	
function PlayerStateAct(){
	// Update Sprite
	PlayerAnimateSprite();
	
	// If There is an Ending Animation
	if (animationEnd)
	{
		state = PlayerStateFree;
		animationEnd = false;
		if (animationEndScript != -1)
		{
			script_execute(animationEndScript);
			animationEndScript = EOF;
		}
	}
}