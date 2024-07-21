/// 

function AttackSlash(){
	
	// Attack Initiated
	if (sprite_index != sprPlayerAttackSlash)
	{
		// Handle Animation
		sprite_index = sprPlayerAttackSlash;
		localFrame = 0;
		image_index = 0;
		
		// Clear Hit List
		if (!ds_exists(hitByAttack, ds_type_list)) hitByAttack = ds_list_create();
		ds_list_clear(hitByAttack);
	}
	
	CalculateAttack(sprPlayerAttackSlashHB);
	
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animationEnd)
	{
		playerState = PlayerStateFree;
		animationEnd = false;
	}
}

/// @function Use Attack Hitbox & Check for Hits
/// @param _coll_spr Sprite to check for collision with others in list

function CalculateAttack(_coll_spr){
	
	mask_index = _coll_spr;
	
	var _hitByAttackNow = ds_list_create();
	var _hits = instance_place_list(x, y, pEntity, _hitByAttackNow, false);
	
	if (_hits > 0)
	{
		// If Instance Not Yet Been Hit, Activate
		for (var _i = 0; _i < _hits; _i++)
		{
			var _hitID = _hitByAttackNow[| _i];
			// Check if Hit by CURRENT Attack
			if (ds_list_find_index(hitByAttack, _hitID) == EOF)
			{
				ds_list_add(hitByAttack, _hitID);
				
				// Activation Logic
				with(_hitID){
					
					//image_blend = c_red;
					if (entHitScript != EOF) script_execute(entHitScript);
					
				}
			}
		}
	}
	
	// Cleanup
	ds_list_destroy(_hitByAttackNow);
	mask_index = sprPlayer;

}
	
/// @function Handle Attacked Entity

function EntityHitDestroy(){

	instance_destroy();

}

/// @function White Flash on Hit

function EntityHitSolid(){

	flash = 0.5

}