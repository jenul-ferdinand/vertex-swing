draw_set_font(fnt_level);

var view_w = view_wport[0];
var view_h = view_hport[0];

var str = "Level: " + string(room)
var xx = 10;
var yy = 10;
var c = make_colour_rgb(160, 160, 160);
draw_text_colour(xx + 4, yy, str, c,c,c,c,1);
var c = c_white;
draw_text_colour(xx, yy, str, c,c,c,c,1);

draw_set_font(fnt_fps);

var str = "FPS: " + string(fps);
var xx = view_w - 10 - string_width(str);
var yy = 8;
var c1;
if (fps < 30) c1 = make_colour_rgb(178, 20, 26);
else c1 = make_colour_rgb(0, 153, 0);
draw_text_colour(xx + 3, yy, str, c1,c1,c1,c1,1);
var c2;
if (fps < 30) c2 = c_red;
else c2 = c_lime;
draw_text_colour(xx, yy, str, c2,c2,c2,c2,1);

draw_set_font(-1);