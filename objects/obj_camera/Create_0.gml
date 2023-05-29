//
enum cam_mode
	{
		follow_object,
		follow_mouse_peek,
		move_to_follow_object,
	}


view_w = camera_get_view_width(view_camera[0]);
view_h = camera_get_view_height(view_camera[0]);

peek_amount = 0.2;

globalvar shake;
shake = 0;

