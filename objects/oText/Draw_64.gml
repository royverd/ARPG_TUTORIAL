/// @desc Draw Textbox

draw_sprite_stretched(sprTextBoxBg, background, x1, y1, x2 - x1, y2 - y1)
InitText(fText, fa_center, fa_top, c_black);

var _print = string_copy(message, 1 , textProgress)
draw_text(( x1 + x2) / 2, y1 + T_STROKE, _print);
draw_set_color(c_white);
draw_text(( x1 + x2) / 2, y1 + T_STROKE - T_ISTROKE, _print);




