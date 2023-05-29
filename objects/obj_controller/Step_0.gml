second_counter++;
if (second_counter >= room_speed) 
{
	level_timer++; 
	second_counter = 0;
}


if (keyboard_check_pressed(vk_escape))
{
	game_end();	
}

if (keyboard_check_pressed(vk_right))
{
	room_goto_next();	
}
if (keyboard_check_pressed(vk_left))
{
	room_goto_previous();	
}