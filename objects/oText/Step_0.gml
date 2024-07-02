/// @desc

lerpProgress += (1 - lerpProgress) / 50; // Add 1/50th per frame, growing slower
textProgress += global.textSpeed;

// Get estimated value at % lerp progress 
x1 = lerp(x1, x1Target, lerpProgress);
x2 = lerp(x2, x2Target, lerpProgress);


// Skip Text
if (keyboard_check_pressed(vk_space))
{
	var _messageLength = string_length(message);
	if (textProgress >= _messageLength)
	{
		instance_destroy();
		// Decrement All Remaing Ticket's Values
		if (instance_exists(oTextQueued))
		{
			with (oTextQueued) ticket--;
		}
		else
		{
			with (oPlayer)
			{
				playerState = playerStateLast;
				skipStepEvent = true // In order to not re-open text in the same frame
			}
		}
	}
	else
	{
		if (textProgress > 2)
		{
			textProgress = _messageLength; // Accerate Message Display
		}
	}
}





