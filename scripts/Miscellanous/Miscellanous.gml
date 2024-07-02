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

/// @desc Initializes Text Properties
/// @arg _font The font to use
/// @arg _hpos Horizontal Alignment
/// @arg _vpos Vertical Alignment
/// @arg _color Color of the text
function InitText(_font, _hpos, _vpos, _color){
	draw_set_font(_font);
	draw_set_halign(_hpos);
	draw_set_valign(_vpos);
	draw_set_color(_color);
}