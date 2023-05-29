if (!instance_exists(obj_player)) exit;
var cx = camera_get_view_x(view_camera[0]);
var cy = camera_get_view_y(view_camera[0]);
var following = obj_player;
var mode = cam_mode.follow_mouse_peek;

switch (mode)
{
	case cam_mode.follow_object:
		if (!instance_exists(following)) break;
		cx = following.x - (view_w/2);
		cy = following.y - (view_h/2);
		cx += random_range(-shake, shake);
		cy += random_range(-shake, shake);
		shake *= 0.9;
	break;
			
	case cam_mode.follow_mouse_peek:
		cx = lerp(following.x, mouse_x, peek_amount) - (view_w/2);
		cy = lerp(following.y, mouse_y, peek_amount) - (view_h/2);
		cx += random_range(-shake, shake);
		cy += random_range(-shake, shake);
		shake *= 0.9;
	break;
			
	case cam_mode.move_to_follow_object:
		if (!instance_exists(following)) break;
		cx = lerp(cx, following.x - (view_w/2), 0.1);
		cy = lerp(cy, following.y - (view_h/2), 0.1);
			
		if (point_distance(cx, cy, following.x - (view_w/2), following.y - (view_h/2)) < 1)
		{
			mode = cam_mode.follow_object;
		}
	break;
		
}

camera_set_view_pos(view_camera[0], cx, cy);

if (keyboard_check_pressed(ord("R"))) { game_restart(); }