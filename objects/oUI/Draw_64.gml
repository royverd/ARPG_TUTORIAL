/// @desc 

// Draw Player HP

var _playerHealth = global.playerHealth;
var _playerHealthMax = global.playerHealthMax;
var _playerHealthFrac = frac(_playerHealth);

_playerHealth -= _playerHealthFrac;

for (var i = 1; i <= _playerHealthMax; i++)
{
	// Determine Health Frame to Display
	var _imageIndex = (i > _playerHealth);
	
	if (i == _playerHealth + 1)
	{
		_imageIndex += (_playerHealthFrac > 0);
		_imageIndex += (_playerHealthFrac > QUARTER);
		_imageIndex += (_playerHealthFrac > HALF);		
	}
	
	// HP Offset
	draw_sprite(sprHealth, _imageIndex, 8 + ((i + 1) * 16), 8);
	

}