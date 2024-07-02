/// @desc Create Text & Text Box
/// @arg message Message String to Display
/// @arg background Frame Number of Text Box Background Sprite
function NewTextBox(_message, _background = 1){
	var _obj;
	if (instance_exists(oText)) _obj = oTextQueued;
	else _obj = oText;
	
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		message = _message;
		// Get Caller Id if Any
		if (instance_exists(other)) originInstance = other.id else originInstance = noone;
		// Set Background (obsolete)
		if (argument_count > 1) background = _background;
		else background = DEFAULT_TBG_FRAME;
	}
	
	with (oPlayer)
	{
		if (playerState != PlayerStateLocked)
		{
			lastState = playerState;
			playerState = PlayerStateLocked;
		}
	}
	
}