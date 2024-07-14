/// @function ScreenShake(_magnitude, _frames)
/// @param _magnitude set the stength
/// @param _frames sets the length of the shake in frames
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

/// @function Initializes Text Properties
/// @param _font The font to use
/// @param _hpos Horizontal Alignment
/// @param _vpos Vertical Alignment
/// @param _color Color of the text
function InitText(_font, _hpos, _vpos, _color){
	draw_set_font(_font);
	draw_set_halign(_hpos);
	draw_set_valign(_vpos);
	draw_set_color(_color);
}