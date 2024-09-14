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

// Coins

var _xx, _yy;

// Coin Icon
_xx = MARGIN + 20;
_yy = COIN_UI_YY;
draw_sprite(sprCoinUI, 0, _xx, _yy);

// Coin Text
InitText(fText, fa_left, fa_top, c_black);
_xx += sprite_get_width(sprCoinUI) + 4; // 4 is Magic Buffer
_yy = 27; // MN
var _str = string(global.playerMoney);
draw_text(_xx + 1, _yy, _str);
draw_text(_xx - 1, _yy, _str);
draw_text(_xx, _yy + 1, _str);
draw_text(_xx, _yy - 1, _str);
draw_set_colour(c_white);
draw_text(_xx, _yy, _str);

// Draw Item Box
_xx = MARGIN;
_yy = PLAYER_ITEM_MARGIN;

draw_sprite(sprItemUIBox, 0, _xx, _yy);
if (global.playerHasAnyItems)
{
	
	draw_sprite(sprItemUI, global.playerEquipped, _xx, _yy);
	if (global.playerAmmo[global.playerEquipped] != EOF)
	{
		InitText(fAmmo, fa_right, fa_bottom, c_white);
		draw_text
		(
			_xx + sprite_get_width(sprItemUIBox) + 1,
			_yy + sprite_get_height(sprItemUIBox) + 1,
			string(global.playerAmmo[global.playerEquipped])
		)
	}
}





