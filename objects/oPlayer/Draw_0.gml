/// @desc

// Draw Shadow
draw_sprite(sprShadow, 0, floor(x), floor(y));


// Adjust Draw Height
draw_sprite_ext(
	sprite_index,
	image_index,
	floor(x),
	floor(y - z),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
	
);








