var mousex = device_mouse_x_to_gui(0);
var mousey = device_mouse_y_to_gui(0);
var c = grapple_bar_colour;
draw_healthbar(mousex - 25, (mousey + 30), (mousex - 25) + 50, (mousey + 30) + 5, grapple_timer, c, c, c, 0, false, false)