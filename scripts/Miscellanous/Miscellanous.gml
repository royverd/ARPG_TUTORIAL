/// @desc ScreenShake(_magnitude, _frames)
/// @arg _magnitude set the stength
/// @arg _frames sets the length of the shake in frames
function ScreenShake(_magnitude, _frames){
	
	with (global.insCamera)
	{
	if (_magnitude > shakeRemain)
		{
			shakeMagnitude = _magnitude;
			shakeRemain = shakeMagnitude;
			shakeLength = _frames;
		}
	}


}