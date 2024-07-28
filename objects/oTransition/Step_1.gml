/// @desc Progress Transition

with (oPlayer) state = PlayerStateTransition;

if (leading == OUT)
{
	percent = min(1, percent + TRANSITION_SPEED);
	
	if (percent >= PERCENT_END) // If Screen Fully Obscured
	{
		room_goto(targetRoom);
		leading = IN;
	}
	
}
else // leading == IN
{
	percent = max(0, percent - TRANSITION_SPEED);
	
	if (percent <= PERCENT_START) // If Screen Fully Revealed
	{
		with (oPlayer) state = PlayerStateFree;
		instance_destroy();
	}
	
}








