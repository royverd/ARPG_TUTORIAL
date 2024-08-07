/// @desc

// Draw Shadow
draw_sprite(sprShadow, 0, floor(x), floor(y));

// Every 8 Frames, Act for 3 Frames	
if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0) && (flash == 0)
{
	// Skip Draw//	
}
else
{
	if (flash != 0)
	{
		shader_set(flashShader);
		uFlash = shader_get_uniform(flashShader, "flash");
		shader_set_uniform_f(uFlash, flash);
		
	}
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
	
	if (shader_current() != EOF) shader_reset();
}







